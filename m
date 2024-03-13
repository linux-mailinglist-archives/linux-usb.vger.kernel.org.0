Return-Path: <linux-usb+bounces-7920-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3B87A4C8
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 10:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C438F1C21BA7
	for <lists+linux-usb@lfdr.de>; Wed, 13 Mar 2024 09:20:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18FB1CF87;
	Wed, 13 Mar 2024 09:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="t+7+1JNU";
	dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="GDzHROGz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="WPri12cR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3771B95F
	for <linux-usb@vger.kernel.org>; Wed, 13 Mar 2024 09:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.156.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710321598; cv=fail; b=YItDn5Vvt1GAyCElttOHRI2PLarujA7/M1J4EsTr7wanu1eS08m2omxSunL5gZiLta9IDJPaQXZvbMLBA/37wfboukHP3M+P5n+BewBZhzRTaQ4huV7Eqc3zYUAhTVT6eI15LgvMZKgozTNqYgVraiUVZslyNJtrox9BYN1CWrI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710321598; c=relaxed/simple;
	bh=YhKqOuJ9oV+Kog1fjtn+vl3JKN/W3szKolThuRlzlRw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AgZGggUjHmeVLx6AJoKXxSSGYivknAq39/N297kSlhuzeeJ0rX2Q8P1AvnBVrM+9gx+NO1XCZ6w5m+0OyVA+AysbRw4J4Idezd1yTdfFs7nhARG2vTzxTvAsPwp/6haqs0CLNmmJzf1klycXqqvlJVkTGjXp76MuxA3A/MV8jNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com; spf=pass smtp.mailfrom=synopsys.com; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=t+7+1JNU; dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=GDzHROGz; dkim=fail (1024-bit key) header.d=synopsys.com header.i=@synopsys.com header.b=WPri12cR reason="signature verification failed"; arc=fail smtp.client-ip=148.163.156.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=synopsys.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=synopsys.com
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42D8Kecp028835;
	Wed, 13 Mar 2024 02:19:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	from:to:cc:subject:date:message-id:references:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	pfptdkimsnps; bh=7pfOVeRyVeKuKn+oNgnmwe8a+AHWyRjbO9uJlKQ1juA=; b=
	t+7+1JNU/+u+qGRBPQ6SlK37zl3OoM/cmVkL7kI471Fhrv+X5xvuN1cUawIEGr0B
	FN4qSl+DWSZApZ/5rQEBLzpm22rZMGrUqj16tah5JTuKsvq3iLwpX9yWg8uZ9+0D
	DHOV+9P+v49L3gayqzz4BqcY9vG4cPlPV/zIrSAKq1BN1KPjIrcguX0hOu7b3FAN
	R38HnriX5qJw3xWY7MleuX+HS/W4fG5ws0PyOM5r1OoQAiaDXKRoxAl1G/Ly1YxN
	MaujRTBJI7vC6jLfi2uy6jf8OCRsFP0UCog1IQLcZIi7Rs0X0KW2IpqWWiuLs2dF
	0W/De28h91uqgHsjogKQHw==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3wtugwkgp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 02:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1710321587; bh=YhKqOuJ9oV+Kog1fjtn+vl3JKN/W3szKolThuRlzlRw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=GDzHROGzpehpZ5zFyqjxR7QqXmkaUUfpclLkQ87bYFKbhFjv0zz1S7QduMrn30jig
	 3dqnfICR2t94tCpI3CJ1/ycWh7eK5aE5GzbLIlNK5wS2ZTverTq9CVW/Cg1apK0zIg
	 c5jzinKYITAdRawtIIK23AXqUgefhV26JOFfkt+vvaY8i3ryF46d9D1Z01mMv8ngJ5
	 yLll4Rjz2Gfew19fdKT142dZrc5nyX/b28gIiTBbD+e3yiBw5eIn7Js5TaGwunjk4V
	 Wu541Yq69BHaWSaP5WjWxyJ1Yos5pXkJPHTEBSYpU83jtluoclXLqaCUQL8r4nSYU3
	 3x6KUKTg+w93A==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 234384052B;
	Wed, 13 Mar 2024 09:19:47 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
	by mailhost.synopsys.com (Postfix) with ESMTPS id E6275A006D;
	Wed, 13 Mar 2024 09:19:46 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=WPri12cR;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id 781CB40236;
	Wed, 13 Mar 2024 09:19:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O239Zmx3Z+SD9jw7Ec+9yU/NQoFqua/vKfwgjhbwcU7+0uSZXklMjUVNK6Frveo4I9IquFRKoPedadLaiR48EhO4As9rno2V8yZjDvDGKGCnePqEyl523p/ypCwwukv5PB8XIAVhSWVkq6YsUpeRF9bJY2KkdlCBbIwuY8P5+9PKtmrsCCdLHBURrnx4+4KX7cmhgP6rwKKqNQ+MBRsOlDQ91F0jhNiI6dRR7Z8/pEybLnuFGa4SasfHZuRW1MTyxGnh3Pd5+CC8vJknq9hZCbpyRgCpW1mVZCauFExDC1iByTpx9+IYfH9cL1oVI66AsDu4FIWSU+BG0lS3axeoSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pfOVeRyVeKuKn+oNgnmwe8a+AHWyRjbO9uJlKQ1juA=;
 b=R7bUL6TR2St4ZwK0y7221WbZ8BrK1NkNG/6xjE+PJZwXEhv4+5jeZiaeieThkPWfXaGb+ZPL293yAGyRt7Of1EklupXgj0Pvhi8xLSH1AXwVjD0mlRwtUXYYIqTgZtHR4ySuLVl0eNKMBu6N34vcbYx8Fx1O0GWvGUVPtywlWQSqyJ31QjpWLfLhuX5e7x2ZfReKG/HpqTBR/QmqMkeAA9nAujHiJF8SH9NWCV3cCzfZtl1fK+R6+BUpS8Yd8umiuOQPGTMsuMXETwC38EGdqVzH0x7Z3tLvZWpyru7mbE40PYIow+y8g3GM15zbCOx6NpDoZby7IITYsmBcJ8NJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7pfOVeRyVeKuKn+oNgnmwe8a+AHWyRjbO9uJlKQ1juA=;
 b=WPri12cRZzB14rxD6liW0WzJ5QJVYZcL+3ggBL/LHIGaN/0vzAaSSrKBMXxCTkJHbMXAxbHu8hCdDsFLOt4kG2gsrSLeLOCQmSQsnjBTABxQ+MJjFnWHPb5xkZoQfpomU87uEvUGvi+XbYvp2Bxh3i0CK/Y/fMvQvcRY0+vZWJU=
Received: from PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.36; Wed, 13 Mar
 2024 09:19:42 +0000
Received: from PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b]) by PH7PR12MB8796.namprd12.prod.outlook.com
 ([fe80::2c3d:b3d4:f995:915b%6]) with mapi id 15.20.7362.036; Wed, 13 Mar 2024
 09:19:42 +0000
X-SNPS-Relay: synopsys.com
From: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: John Youn <John.Youn@synopsys.com>,
        Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
Subject: [PATCH 4/7] usb: dwc2: Add eUSB2 PHY disconnect flow support
Thread-Topic: [PATCH 4/7] usb: dwc2: Add eUSB2 PHY disconnect flow support
Thread-Index: AQHadSeVs115QvChmEe/IGU77ifdaQ==
Date: Wed, 13 Mar 2024 09:19:42 +0000
Message-ID: 
 <9d50b83df693cda8c391313e90048df8dd611c04.1708948356.git.Minas.Harutyunyan@synopsys.com>
References: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
In-Reply-To: <cover.1708948356.git.Minas.Harutyunyan@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB8796:EE_|SN7PR12MB6910:EE_
x-ms-office365-filtering-correlation-id: b88c025d-b7f9-4136-1598-08dc433eb7a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 QZtFYoklEk6a4vmH+wYTrm1oZX1UG1xYSREpwoZst2ETphLPe63ap2Igv5Yh+gxksKua2q/oRAf13W7oiwOdSE1gIzYq6kiVnFbWPcRf45ohL90SZY14bCec2wUWnMGZf8Lso/jNHPTN+s9QjHTqLfDVH2DXQ6fn5ZRTpCgnPxw1UGPXmGWbVGiBeWX8YAlNhVv/q7VygYa7j8lblxcwwiyM5MewE/oWuCYdv/VLGOQqVvzZc7psffq2aIljFJavznD6BfC5EWt9lO8F9xlweS3/Wp3t0cLiygC6fza72QRTowFm+m4TH8WFpMfFEWJxSm2tBg3db127Y/pNmOzQJRKO3aWvbEd3ikQ7pxSugWrzycczhFIpV5wmVTAyS2m4L9t9vQ40hwgm/U9TZjhjMOnFMIAiEbC6+yo0MzEA6DmzhTLGPpT4vDeOio6XcEjuJiMwK2TCDjg5OCtzGhUvWuUPKeE2ySDaHUjmdNgJqf0X1OwEXBaWOzVb7JYhvbcVoYRHfyLeibbGfovqHZ4rns5chdkerNfKFP6GE+77C1mGUxM0A3ShD3rwBTVZDth8XScJxqLgy8iwmQ0Onsd8E/+qXJOvo0xUiWFSRDwY055G2nBWv9yTJqOzHoriYANsvM4qKi4RgyQxXuDFGNsL6n9odoI7Bo1e8x4Ye+96gRvlTyFrTVA5pFpmMO6aQLKccGmw56qsDDrxRl5yzFGXhTk/5rt8Uou0Y6p5kGcrdFQ=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB8796.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?L6GuWD2lFhI5fAsCN5MU7jYyGzYzWMDaoaOVrUPeRRdIVTUMgkb7QfvJci?=
 =?iso-8859-1?Q?uWU0mVOD4TDhb9nlOz3vhwatnbEbEkwjr0xmoBzVRn4CZ1AhsDdl4JSi++?=
 =?iso-8859-1?Q?guJhVdYOPob36Exk7RLfj/S3/X9zKnoIqLDI+cwlE/GlRB27Q6/bA2X5mz?=
 =?iso-8859-1?Q?lQKZx7fyu/P6xeOjz3qrg5bDDfmLch7/3PNpZPjXJbby+pda+cgdYPfezw?=
 =?iso-8859-1?Q?pVuE9kpIQmAjkYTZRZMJEzOjrv4JZF7xRmcIMtKE0XEwr9QqXHI8LoE0oJ?=
 =?iso-8859-1?Q?bFeyBQHCFGr1xWcFKnbbgcOvea9d+PKF2k45Sh9omSX8N8tKSCl6qJ5/i3?=
 =?iso-8859-1?Q?CQdE0vk+VDKB66NkobzfiUU/XNJ/QROc2Aho0FLsgFyMbShAegoEI07swK?=
 =?iso-8859-1?Q?kJmVBjRDPyTxkr3vFnBIi1ij0NkuiZgoHuqbf0GbBIa4xvcPKDIEpsOmOS?=
 =?iso-8859-1?Q?6Al+/mQpsJXKDzzQsLaDL+f6CerOaxoJwvdphsS0xEE23PB5a+V7VhHwOR?=
 =?iso-8859-1?Q?Xvq2tAhXjNbDwVq9cwBKFmhHlv5bbkU0eq4SR4QllRB1uJEPD0WqANkpy3?=
 =?iso-8859-1?Q?sqwpsB+gItMmMVO8jjWbHu8ymg+3NXX5hsqg4Xa1XMu8EF9JwMFKbE49bQ?=
 =?iso-8859-1?Q?eJ+6tmA6svGmNhg+tqWp55DqAFjU/ZmN5W058NgY7NQcF9F5WgwKUhm+BG?=
 =?iso-8859-1?Q?rIEE7MqQ9NXwYIz/zBG2NPoChKEWFA1CKxj0zY3DJ8cLTZGQBR7WyPjWRs?=
 =?iso-8859-1?Q?4WkfMOiK2td/STmIe1movM3aypJQfN5Py8jyADhlhHgxmmyRIlV9MQhsnA?=
 =?iso-8859-1?Q?PV67/eUIWBPPSxntsSvqTalIaHITeSr4qW6VhUiEYeZroDZjBAd8vVn29T?=
 =?iso-8859-1?Q?FC5MN3cBPIFxqrDCEW0zcT2t7pZw1w/YVBGspzMx2n6XHmK+c+732bcDpL?=
 =?iso-8859-1?Q?vOQB86J5ujH30TbVXSgyNS+vjTWKi787h65eNk3aP+BPO7J3quibQ9vdBj?=
 =?iso-8859-1?Q?555FqeHb9yN9Ldlj6lP/dNjAhpbiCw/DmhjV/IGXWvgWKnEgDm5dcARAVI?=
 =?iso-8859-1?Q?ml2ZQ50ZL5+lMYiuB9EITmC+em1cX1lEff724ZrthGZ31qwXeMjMmvNLf0?=
 =?iso-8859-1?Q?zhw0S5LdunfD28UtL8ZheUGXpjkvSaPkiEz9hHZdKn99hp17QbKeeIVoW+?=
 =?iso-8859-1?Q?UE/zt2CjYHIOGJEXUttD8diz9zYOsIZgK8/8UodHBE8ayvJExjNiMAOZSf?=
 =?iso-8859-1?Q?QH5bNJfexsfM4RIrafqOYvdjXaz4vAR9uljF5IwZo+kuEBF3a6O7mGwuwq?=
 =?iso-8859-1?Q?7LXlWPWPjM+RYrkysb9AfV/uHOnZN2EqzWQzDqWJoj4/IYJYdnWi5+Prr4?=
 =?iso-8859-1?Q?KkI5pE9EJ20ayLe2+m6Fk4SPOQEs0cYJJJinnzKOn+3bKVkTtyhgGM4JYv?=
 =?iso-8859-1?Q?lmWqS3PJYNCSRDBShyJYhQ6uzU6unWFjr+NLPslIxnOTCDHGtyKixzvlzm?=
 =?iso-8859-1?Q?vANOSj3ssvQXMbm2yxQYfePUwcE1UrJwmFhgtZjnjH0sVQ8gVUa6YjOK5x?=
 =?iso-8859-1?Q?bF3yJ0SnM1HCJ03RhQo8PIqi+yRLDucA33wiS/A7Q5htyMsN7X0qFBaOFy?=
 =?iso-8859-1?Q?Rnz/4KJZS+cKHtrrnxfC52k6HzX8Lvr7WG?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	a6ENiWLvwfuMeKFTJpA0IGNJGgXUGW9U8pBCg+VNHE5FPFJhK2YPusbskTG8XuOl5HBP8IILCdPyam0ACebNCWonOEGc4PKUbnL6qaRjImYuiFx3GLrq/G03vpGR8oSO4HBhIlyu6TIfUwRk+V3aoGB5YoGAqfpseLOLb4bAzCSm3p/olsO5CTqMntmNmm97YC9HZ6TPgA1wI1ERaP3MVa7Kh+XC682ezAH1QJC5PSMwB9MBrAwSsNEQKwud74yxQFNFOu8Bzh7rzp+stTzlOBPR3M2UpI52OT57xZS/wpAdmYBRWDAd3AwtHXN9yQ2zOffuaumNCpBR13dYILc5RtFmuWl/EuKBBHsj/OVSLjH0yNsZVoZbgrsy5kk3f/MtALOX3HJgrmQUfL2pX9K0KhLMJHHQx0J8zuQ+6F9c/vYu6IhNsdh2VHhAALUhOtmIyLnqR2Fzhnu2UZFac91hcQNgE8Rx69XKhonLZbSto56eWPDpzacJT9LI3xOObur5ER/ZTIZh2AgcKaNWOfnXPnBYbNELbSL80Oc3dIaNSydwjsQKlK9O9cb21A/UeMxUplMH63Lwen9pkkVx4pf85oKKWWjeafpIjaZ2H8Zgd82E+hUFQ+nLsLoKCk/T2QffFVsNRdwfyu5k187zzE9mjw==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8796.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b88c025d-b7f9-4136-1598-08dc433eb7a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 09:19:42.7103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EvXuCd1RBxWRY9mqY2o3JWeh7q0I2L5WxkFXScvgV0CC68CD+lfbw2malptPUy4OENEq7gdiv+vS/v3x3R4ZFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910
X-Proofpoint-GUID: h3I1lEk0fN49IVm2gkC4aO2xqIviqpQT
X-Proofpoint-ORIG-GUID: h3I1lEk0fN49IVm2gkC4aO2xqIviqpQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130067

To support eUSB2 PHY disconnect flow required in Soft disconnect
state set GOTGCTL_EUSB2_DISC_SUPP bit, if applicable.

On Session End Detected interrupt clear PCGCTL_GATEHCLK and
PCGCTL_STOPPCLK bits if eusb2_disc parameter true.

Signed-off-by: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
---
 drivers/usb/dwc2/core_intr.c | 21 ++++++++++++++++++---
 drivers/usb/dwc2/gadget.c    |  5 ++++-
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/dwc2/core_intr.c b/drivers/usb/dwc2/core_intr.c
index 158ede753854..bb6bb771375a 100644
--- a/drivers/usb/dwc2/core_intr.c
+++ b/drivers/usb/dwc2/core_intr.c
@@ -84,6 +84,7 @@ static void dwc2_handle_otg_intr(struct dwc2_hsotg *hsotg=
)
 	u32 gotgint;
 	u32 gotgctl;
 	u32 gintmsk;
+	u32 pcgctl;
=20
 	gotgint =3D dwc2_readl(hsotg, GOTGINT);
 	gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
@@ -96,8 +97,22 @@ static void dwc2_handle_otg_intr(struct dwc2_hsotg *hsot=
g)
 			dwc2_op_state_str(hsotg));
 		gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
=20
-		if (dwc2_is_device_mode(hsotg))
+		if (dwc2_is_device_mode(hsotg)) {
+			if (hsotg->params.eusb2_disc) {
+				/* Clear the Gate hclk. */
+				pcgctl =3D dwc2_readl(hsotg, PCGCTL);
+				pcgctl &=3D ~PCGCTL_GATEHCLK;
+				dwc2_writel(hsotg, pcgctl, PCGCTL);
+				udelay(5);
+
+				/* Clear Phy Clock bit. */
+				pcgctl =3D dwc2_readl(hsotg, PCGCTL);
+				pcgctl &=3D ~PCGCTL_STOPPCLK;
+				dwc2_writel(hsotg, pcgctl, PCGCTL);
+				udelay(5);
+			}
 			dwc2_hsotg_disconnect(hsotg);
+		}
=20
 		if (hsotg->op_state =3D=3D OTG_STATE_B_HOST) {
 			hsotg->op_state =3D OTG_STATE_B_PERIPHERAL;
@@ -117,7 +132,7 @@ static void dwc2_handle_otg_intr(struct dwc2_hsotg *hso=
tg)
 			 * disconnected
 			 */
 			/* Reset to a clean state */
-			hsotg->lx_state =3D DWC2_L0;
+			hsotg->lx_state =3D DWC2_L3;
 		}
=20
 		gotgctl =3D dwc2_readl(hsotg, GOTGCTL);
@@ -286,7 +301,7 @@ static void dwc2_handle_session_req_intr(struct dwc2_hs=
otg *hsotg)
 		hsotg->lx_state);
=20
 	if (dwc2_is_device_mode(hsotg)) {
-		if (hsotg->lx_state =3D=3D DWC2_L2) {
+		if (hsotg->lx_state !=3D DWC2_L0) {
 			if (hsotg->in_ppd) {
 				ret =3D dwc2_exit_partial_power_down(hsotg, 0,
 								   true);
diff --git a/drivers/usb/dwc2/gadget.c b/drivers/usb/dwc2/gadget.c
index b517a7216de2..680737d471c1 100644
--- a/drivers/usb/dwc2/gadget.c
+++ b/drivers/usb/dwc2/gadget.c
@@ -3420,8 +3420,11 @@ void dwc2_hsotg_core_init_disconnected(struct dwc2_h=
sotg *hsotg,
=20
 	dwc2_hsotg_init_fifo(hsotg);
=20
-	if (!is_usb_reset)
+	if (!is_usb_reset) {
 		dwc2_set_bit(hsotg, DCTL, DCTL_SFTDISCON);
+		if (hsotg->params.eusb2_disc)
+			dwc2_set_bit(hsotg, GOTGCTL, GOTGCTL_EUSB2_DISC_SUPP);
+	}
=20
 	dcfg |=3D DCFG_EPMISCNT(1);
=20
--=20
2.41.0

