import '@/assets/styles/global.css'

export const metadata = {
	title: 'Invoice App',
	description: "Invoice App's solution",
}

export default function Layout({ children }: { children: React.ReactNode }) {
	return (
		<html lang='en'>
			<body>{children}</body>
		</html>
	)
}
