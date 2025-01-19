Return-Path: <linux-usb+bounces-19529-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 982B1A16461
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2025 23:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8BF53A41F7
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2025 22:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E288C1DFDAB;
	Sun, 19 Jan 2025 22:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="agU1KO1F"
X-Original-To: linux-usb@vger.kernel.org
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2065.outbound.protection.outlook.com [40.92.62.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FB21DA3D;
	Sun, 19 Jan 2025 22:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.62.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737327413; cv=fail; b=l2rWUBvTpt7xWw3bstm+jdidP2P3BXaaX8+c9DdulSz6DurvW2uBi9KElQdyKliBDeJHlh71fLtDxIxSi8Ks+ViDVckiTo6HSLFg5q74WIqKUNw341DtkkQkk/gRjGYDLA7rTzKAHQblVAdLDIEpOdxVDo8VUPRQT9Er/H/pMjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737327413; c=relaxed/simple;
	bh=+JjTKMP7pSIWOu29NhbtlTPtJFXX62KPafMbtGphI3M=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=u+YKbqk619t2UwciAnxQ3ZdMQ8AcBmz59SMlfBmM/M7jPwoik7+J8EXHMnzpsPKCQ6Da4PcgKK4baRBKrRF9HmtkqrVxdf3Q38Z8oIR4G4V7gt4Kq49fLgPv01Bgor4DacSVNmW2CD61txLxS2p2fekf+5DpCUYhpdD75fRKtj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=agU1KO1F; arc=fail smtp.client-ip=40.92.62.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Edztf6P9lobEw3QAYIHTUWHLWkPMRmOMmkAiwrkHF2qyK9gtzz9viYBr39PMWVz2AxeOop6qmm+2hjyJz9a4qrGZZ1d+kVsbZAGrR7wbY/1caNd4pLA4Xdd7u21DNxXcr9vavQiL2z7rac7tcF7Mgul4Ab2jMgJ6TgoQSPSsPRNK3bUoXIFuC1wPSYzx7C114NhpmncvraXJwSD1o73yq3EePvKB9johIJ7FPS3OzfqPk5BMEvsVQPi3qOIrD8qDB+6Dm1kR+V967nMjiOQgKO28N3v52cXSF0LOI35WM0a13WM21JhOYX9bWz/2Arijd2ZwDK5d7IBs9dbQJd5Trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JjTKMP7pSIWOu29NhbtlTPtJFXX62KPafMbtGphI3M=;
 b=AVTZSKLY710MhdGycz9Nyo3YNZyrt2Ime2AihLeW/XSJ1wLQNj7Eh4N7k0aGDuAjP9w9pgSnQq66cH8Xe1/QzaV3jjQqJesP0SWWiIT2s9s+CikMaUUOv5u3v3jkhWWLjFRixSTD419e/fbUDiZJntv4vrbv/B79EZ60QqzqG6cEnsqQZcTx7s+CLIWDvmiPxrEotqqJloBpUHBKgtZoz8tEVh3+tm0i8iIRGZEnw1neIN6uzkujVEmRE70j7o+CM11/9Wg+bjBsaMDPIMRLFQK/Yw0v/aZpM/2PpIetO54dVZpnky3OztsyimhduG4Ls4PKqsgOFCeBdTEw9nL98A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JjTKMP7pSIWOu29NhbtlTPtJFXX62KPafMbtGphI3M=;
 b=agU1KO1F6Nl+8hrot9fhEp4J6EwHFWef7jwu+J/j90cvjUWagAIoUHJnQrFmP1tHfjLBTU6BjR/U63wnDrkgfA412+gD/j6XzIbtf3KGp1pbk4wXD2xxdepXWSMssWwHjGri3odmOGqy4nl/g5nkoPTqoxG9aLcWqHJP/3Fbhwl+iO0rio0uf/yEdrZwpYbS40xIjf4Gxd9h48JjjNABxc9pjjrMdHQaoZ+xT5O5nvAPeSKKSk5nwf/v30UfPXBzxs20/KW7VkIOgQLecN8TnAhmbhbgE63sOgzNMOjLvtowIdoe2pUYq2v/sHjixnFyPqggGIF7/Q33GMlMkhMJcw==
Received: from SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:293::17)
 by SY0P300MB0028.AUSP300.PROD.OUTLOOK.COM (2603:10c6:10:224::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Sun, 19 Jan
 2025 22:56:45 +0000
Received: from SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM
 ([fe80::c7a9:a687:779f:a9cc]) by SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM
 ([fe80::c7a9:a687:779f:a9cc%4]) with mapi id 15.20.8356.017; Sun, 19 Jan 2025
 22:56:45 +0000
From: YAN KANG <kangyan91@outlook.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michal Pecio
	<michal.pecio@gmail.com>, "Ricardo B. Marliere" <ricardo@marliere.net>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: KASAN: slab-use-after-free Read in usbhid_raw_request
Thread-Topic: KASAN: slab-use-after-free Read in usbhid_raw_request
Thread-Index: AQHbasUjkBtqhxS6REaz0EF3D5Dg6Q==
Date: Sun, 19 Jan 2025 22:56:45 +0000
Message-ID:
 <SY8P300MB042106286A2536707D2FB736A1E42@SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY8P300MB0421:EE_|SY0P300MB0028:EE_
x-ms-office365-filtering-correlation-id: 032406c4-c067-468a-a623-08dd38dc8c31
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799003|15080799006|8062599003|461199028|7092599003|8060799006|19110799003|102099032|1602099012|10035399004|440099028|3412199025|4302099013|3430499032|11031999003|12091999003|41001999003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?D23sQjSauXSrbwpeKuBYbes+QRRnFoqCxXwGiDnniDQE8FFbh/NE7bWU6k?=
 =?iso-8859-1?Q?Okn4QMLX1usZ4dONbWMZVUoxwHXzHcWn7bdzETlxPhNZVUfynk6WDSFU+X?=
 =?iso-8859-1?Q?vT3SAilR4GqtN53yJFLtYGkINmBSMlp8MX8Qn5V0Mo22M9thGxeIkPqNF0?=
 =?iso-8859-1?Q?PBJLNjaqkg/D2XXQMBMSzFVNqRYdfwWNfbIU2eRIz7MZ5r1owpaepRv3EV?=
 =?iso-8859-1?Q?9QDHZjjxoM0qAMZAJg2zfoCrGv2qOLEKic0REB3faW7L9ccRRDtMppyitc?=
 =?iso-8859-1?Q?7+7PAaPYAeDjd8nYMnINeteX4YA/3jCeZZj1YZz6JqdK35eLBFJVePlepv?=
 =?iso-8859-1?Q?AHEd3BOhJbxPUmvlv9nT4rm2NiJdsJQGEAov7zSG5GP/ROFlp+3F/hqzeJ?=
 =?iso-8859-1?Q?rZ3TVkpSLw3hOo4WG5PtkAb5lPWM8tMr/zPFoE9RUC7lhBVtcrldePdqdj?=
 =?iso-8859-1?Q?0k5HG6XVDoxzsv50hyJ0KnifuoDJ3mGcs+s94yz4YnlBzeAgQrKa1ih1oO?=
 =?iso-8859-1?Q?APeQWe+WYYxTnqSDhiwFC/P6AuP0npVfQBvsgLE3uWMSCOnUK8FF54udP5?=
 =?iso-8859-1?Q?qLcEdrbp0as7K9r5/3uJHhEB8ZWxC7sHWyayhPrXGVYqofdYrpNl5tUqLd?=
 =?iso-8859-1?Q?bVXuNzUfBx+H9/u0up+Cry7h0TugirjEpUttX48QL46UdsZvNJ7IZv2/xa?=
 =?iso-8859-1?Q?u6WN5IhVqUifTZfQS1FG8kXCuM764YqLUOS4ozd3OhmDx1onI/Eh+L5s1C?=
 =?iso-8859-1?Q?vmWyNL4TNxKutNmxww+igXX6wXfGJPclc4wpeVglK7vBK8dw1tAeYofTd8?=
 =?iso-8859-1?Q?jJXbccNEq0wxff7COJ+yH73pJqNI3xPEMC9nVMAeYfXfcTwzQ7Mmd7VVXh?=
 =?iso-8859-1?Q?qgUPtF3fwIl9hZjHeLl+34Zo1/TVrPOi7EL4NEAyF5XI6CAIBD4e+a0MuX?=
 =?iso-8859-1?Q?mXGYjh6bc6pbt2fw/IzaoGbBSl/MJLYoU51nraJ8nTebNqhmYDaR6ye1R4?=
 =?iso-8859-1?Q?2ZQVW61uI+4miWneQlXLStL4jp0oRCh282laUpFwHuNoGiPQhqSo3GQ8LM?=
 =?iso-8859-1?Q?w4UssVGEmavfvgQbp2VW68+yVQip33AGJBZ8lTkGbiQUKS+d3R8cps3Stt?=
 =?iso-8859-1?Q?3nJoZSRJyFiYJqjmpAcwjhq53SkE/qPuhewfDMnlVi3DKfXApI59anF4m/?=
 =?iso-8859-1?Q?qLFrUUJlv3s7wlG6RTIf1YK0YLIhrvwqeiXhyCI5GX0N/4+GfAuiK8UqKQ?=
 =?iso-8859-1?Q?TM6RoDDSVUPVkv8iQWMpc5wmaqkNAm3wo4FJCSDCXnypUsKLRr1NM5xb6w?=
 =?iso-8859-1?Q?FdAVmk0PB+nmJXTJLPc1OiuQ09tp+BUM2zbQmkL8iuI9nitAqDYjv9cshy?=
 =?iso-8859-1?Q?BW2UO/1v/GG3rdTfx+5uPojHENNTlKWL4lIPG1s8u7sPdXS+TuOHX3drap?=
 =?iso-8859-1?Q?XXr4hG9sPNAOxkBX?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?D1Y8M405O59ZI97U4FGIW++bP8JTvdLM5mfzfvYL1eBv42Tu9NK1zfN9cc?=
 =?iso-8859-1?Q?6N+R8seQOLqNqcsoBChiZ0jgHgFu0yh7NpA1DqQw5LKSm5voZ0nu/1/Wrg?=
 =?iso-8859-1?Q?Dzjgh1aeu4sJ+DuOpfrWpP+oQq5rH7aSTE53q7lwmXG8/qReU873P9DwVG?=
 =?iso-8859-1?Q?178y6c8abC6t6d6sIeBYjsHtWJuCHWXsoJgTm0EvgZeCH0SV8FbHzL9sLu?=
 =?iso-8859-1?Q?e0Trt35HU5TIh/UkmfB9+FhpeM+WmQQ2h9k3XFT4cfl8RfL3VnnsMEYRgv?=
 =?iso-8859-1?Q?UPli6PLks1w+JeSURiD1Ule430QZDMtu0T4cZhtaa+ftQ6S9cHDJ0Uh//D?=
 =?iso-8859-1?Q?FxPB3U7LNzTgaOi8kWveG9rukkDG2eE6bIvlFJQfB8qB7D0x9EB24bvDAP?=
 =?iso-8859-1?Q?l6jROC/+YnZd/vOjYBkyAnB8G4GBLi8YOTrn6EPQM4edT1qZX4RK5KrjP9?=
 =?iso-8859-1?Q?vYe+DbpBqGQldppLJINJEo8REKSDIqZoEneTuDply+Q9YFK8+TdMS81lqI?=
 =?iso-8859-1?Q?7B4Cg5Qb/IlZuOVWltLWwzFP8eKZ3xhtKuP5V81Kwfs0KF2mSwa4HzZM5p?=
 =?iso-8859-1?Q?Jz4KxQ0UNqDH1v1EURsftzNf1Aa6HP2A7IOmT7FQsGmXQiBld55WBzrqeX?=
 =?iso-8859-1?Q?UH5WaHV9Q4MeRQDZSzKtS4T4our5yukkfgtSvIgUYujGY6xcAslC/aJnl/?=
 =?iso-8859-1?Q?m3WhN8z6/SORyWZ7bViiZTlNiqbtxoMZAkvLVen1C5GiQC+Ecd/8ugdE3M?=
 =?iso-8859-1?Q?g4Gfs3kM3fOw3WUoHuTa5GAH7JMS7kp6ihvIxFbJ0TTVGvvnrwNO26L0GL?=
 =?iso-8859-1?Q?uoqUn9Bm0/QshD39K9cq3Z80j5rf5mWj1lgLn/wLd7hA9hJgU/46qsYWTd?=
 =?iso-8859-1?Q?NZARgAwYCQ1SQ3UT9gXeeSkagAeh8c10VGUFX/82HIYWfpb+us8QTnvEFg?=
 =?iso-8859-1?Q?jZX1x0XGmYWsHfBltyPOTn/wKI33SVvJVJ7LKRqnkVFHqPSCjp5fRfyJVJ?=
 =?iso-8859-1?Q?PFia5OgjSYqVtlkq4Fdy53GwjCcbafrkXcrfezNSZH218eOuPa5zVm+Yck?=
 =?iso-8859-1?Q?eSsGVIILZdgK2VE/pfvtpHkFXUruEX1K8TmujkNjoks+NaIVdKBI5KQ0iC?=
 =?iso-8859-1?Q?DSgD7cgmiO074Nw+YcI1qzm9WRemfnVJwXo9q7VwBUcypHh2wM/BTpTwSh?=
 =?iso-8859-1?Q?wKdn47XyqV+j2uvWYCoSdHnL8sF+hJ16GEaMIKJ5GDXM5QhOst8c2BvMAp?=
 =?iso-8859-1?Q?ezxo1A0C86UHt9voncvb7qfs6tY91UfMXt1h18LY4=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY8P300MB0421.AUSP300.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 032406c4-c067-468a-a623-08dd38dc8c31
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2025 22:56:45.2110
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY0P300MB0028

Dear developers and maintainers,=0A=
=0A=
I found a new kernel bug titiled "KASAN: slab-use-after-free Read in usbhid=
_raw_request" while using modified syzkaller fuzzing tool. I Itested it on =
the latest Linux upstream version (6.13.0-rc7), and it was able to be trigg=
ered.=0A=
=0A=
The bug info is:=0A=
=0A=
kernel revision: v6.13-rc7=0A=
OOPS message: KASAN: slab-use-after-free Read in usbhid_raw_request=0A=
reproducer:YES=0A=
subsystem:USB SUBSYSTEM=0A=
=0A=
=0A=
If you fix this issue, please add the following tag to the commit:=0A=
Reported-by: yan kang <kangyan91@outlook.com>=0A=
Reported-by: yue sun <samsun1006219@gmail.com=0A=
=0A=
=0A=
I hope it helps.=0A=
Best regards=0A=
yan kang=0A=
=0A=
Kernel crash log , PoC and .config are listed below.=0A=
=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
crash log :=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
BUG: KASAN: slab-use-after-free in usb_control_msg+0x42d/0x4a0 drivers/usb/=
core/message.c:157=0A=
Read of size 4 at addr ffff8880483f7694 by task kworker/0:0/8=0A=
=0A=
CPU: 0 UID: 0 PID: 8 Comm: kworker/0:0 Not tainted 6.13.0-rc1-00003-gd47747=
59e15b-dirty #87=0A=
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1 04/01/=
2014=0A=
Workqueue: events corsair_void_status_work_handler=0A=
Call Trace:=0A=
 <TASK>=0A=
 __dump_stack lib/dump_stack.c:94 [inline]=0A=
 dump_stack_lvl+0x116/0x1b0 lib/dump_stack.c:120=0A=
 print_address_description mm/kasan/report.c:378 [inline]=0A=
 print_report+0xc0/0x5e0 mm/kasan/report.c:489=0A=
 kasan_report+0xbd/0xf0 mm/kasan/report.c:602=0A=
 usb_control_msg+0x42d/0x4a0 drivers/usb/core/message.c:157=0A=
 usbhid_set_raw_report drivers/hid/usbhid/hid-core.c:927 [inline]=0A=
 usbhid_raw_request+0x231/0x700 drivers/hid/usbhid/hid-core.c:1295=0A=
 __hid_hw_raw_request drivers/hid/hid-core.c:2462 [inline]=0A=
 hid_hw_raw_request+0x109/0x150 drivers/hid/hid-core.c:2484=0A=
 corsair_void_request_status+0xc2/0x130 drivers/hid/hid-corsair-void.c:493=
=0A=
 corsair_void_status_work_handler+0x3f/0xb0 drivers/hid/hid-corsair-void.c:=
512=0A=
 process_one_work+0x99f/0x1bb0 kernel/workqueue.c:3229=0A=
 process_scheduled_works kernel/workqueue.c:3310 [inline]=0A=
 worker_thread+0x66e/0xe80 kernel/workqueue.c:3391=0A=
 kthread+0x2c7/0x3b0 kernel/kthread.c:389=0A=
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147=0A=
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244=0A=
 </TASK>=0A=
=0A=
Allocated by task 788:=0A=
 kasan_save_stack+0x24/0x50 mm/kasan/common.c:47=0A=
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68=0A=
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]=0A=
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:394=0A=
 kmalloc_noprof include/linux/slab.h:901 [inline]=0A=
 kzalloc_noprof include/linux/slab.h:1037 [inline]=0A=
 usb_alloc_dev+0x55/0xe10 drivers/usb/core/usb.c:650=0A=
 hub_port_connect drivers/usb/core/hub.c:5424 [inline]=0A=
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]=0A=
 port_event drivers/usb/core/hub.c:5821 [inline]=0A=
 hub_event+0x278c/0x4d30 drivers/usb/core/hub.c:5903=0A=
 process_one_work+0x99f/0x1bb0 kernel/workqueue.c:3229=0A=
 process_scheduled_works kernel/workqueue.c:3310 [inline]=0A=
 worker_thread+0x66e/0xe80 kernel/workqueue.c:3391=0A=
 kthread+0x2c7/0x3b0 kernel/kthread.c:389=0A=
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147=0A=
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244=0A=
=0A=
Freed by task 10742:=0A=
 kasan_save_stack+0x24/0x50 mm/kasan/common.c:47=0A=
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68=0A=
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:582=0A=
 poison_slab_object mm/kasan/common.c:247 [inline]=0A=
 __kasan_slab_free+0x54/0x70 mm/kasan/common.c:264=0A=
 kasan_slab_free include/linux/kasan.h:233 [inline]=0A=
 slab_free_hook mm/slub.c:2338 [inline]=0A=
 slab_free mm/slub.c:4598 [inline]=0A=
 kfree+0x14e/0x4d0 mm/slub.c:4746=0A=
 device_release+0xa3/0x240 drivers/base/core.c:2567=0A=
 kobject_cleanup lib/kobject.c:689 [inline]=0A=
 kobject_release lib/kobject.c:720 [inline]=0A=
 kref_put include/linux/kref.h:65 [inline]=0A=
 kobject_put+0x1d9/0x4f0 lib/kobject.c:737=0A=
 put_device+0x1f/0x30 drivers/base/core.c:3773=0A=
 hub_port_connect drivers/usb/core/hub.c:5361 [inline]=0A=
 hub_port_connect_change drivers/usb/core/hub.c:5661 [inline]=0A=
 port_event drivers/usb/core/hub.c:5821 [inline]=0A=
 hub_event+0x1e78/0x4d30 drivers/usb/core/hub.c:5903=0A=
 process_one_work+0x99f/0x1bb0 kernel/workqueue.c:3229=0A=
 process_scheduled_works kernel/workqueue.c:3310 [inline]=0A=
 worker_thread+0x66e/0xe80 kernel/workqueue.c:3391=0A=
 kthread+0x2c7/0x3b0 kernel/kthread.c:389=0A=
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147=0A=
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244=0A=
=0A=
The buggy address belongs to the object at ffff8880483f7000=0A=
 which belongs to the cache kmalloc-2k of size 2048=0A=
The buggy address is located 1684 bytes inside of=0A=
 freed 2048-byte region [ffff8880483f7000, ffff8880483f7800)=0A=
=0A=
The buggy address belongs to the physical page:=0A=
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x483f0=
=0A=
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0=0A=
anon flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastcpupid=3D0x7ff)=0A=
page_type: f5(slab)=0A=
raw: 00fff00000000040 ffff88801b042000 0000000000000000 dead000000000001=0A=
raw: 0000000000000000 0000000000080008 00000001f5000000 0000000000000000=0A=
head: 00fff00000000040 ffff88801b042000 0000000000000000 dead000000000001=
=0A=
head: 0000000000000000 0000000000080008 00000001f5000000 0000000000000000=
=0A=
head: 00fff00000000003 ffffea000120fc01 ffffffffffffffff 0000000000000000=
=0A=
head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000=
=0A=
page dumped because: kasan: bad access detected=0A=
page_owner tracks the page as allocated=0A=
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__=
GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pi=
d 11168, tgid 11168 (syz-executor), ts 56477967768, free_ts 56149082167=0A=
 set_page_owner include/linux/page_owner.h:32 [inline]=0A=
 post_alloc_hook+0x2e7/0x350 mm/page_alloc.c:1556=0A=
 prep_new_page mm/page_alloc.c:1564 [inline]=0A=
 get_page_from_freelist+0xe4e/0x2b20 mm/page_alloc.c:3474=0A=
 __alloc_pages_noprof+0x219/0x2190 mm/page_alloc.c:4751=0A=
 alloc_pages_mpol_noprof+0x2b6/0x600 mm/mempolicy.c:2265=0A=
 alloc_slab_page mm/slub.c:2408 [inline]=0A=
 allocate_slab mm/slub.c:2574 [inline]=0A=
 new_slab+0x2d5/0x420 mm/slub.c:2627=0A=
 ___slab_alloc+0xbb7/0x1850 mm/slub.c:3815=0A=
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3905=0A=
 __slab_alloc_node mm/slub.c:3980 [inline]=0A=
 slab_alloc_node mm/slub.c:4141 [inline]=0A=
 __kmalloc_cache_noprof+0x280/0x410 mm/slub.c:4309=0A=
 kmalloc_noprof include/linux/slab.h:901 [inline]=0A=
 rtnl_newlink+0xcf/0x1c80 net/core/rtnetlink.c:3911=0A=
 rtnetlink_rcv_msg+0x9e3/0xfb0 net/core/rtnetlink.c:6917=0A=
 netlink_rcv_skb+0x16b/0x450 net/netlink/af_netlink.c:2542=0A=
 netlink_unicast_kernel net/netlink/af_netlink.c:1321 [inline]=0A=
 netlink_unicast+0x5b0/0x940 net/netlink/af_netlink.c:1347=0A=
 netlink_sendmsg+0x8f1/0xe10 net/netlink/af_netlink.c:1891=0A=
 sock_sendmsg_nosec net/socket.c:711 [inline]=0A=
 __sock_sendmsg net/socket.c:726 [inline]=0A=
 __sys_sendto+0x4fc/0x570 net/socket.c:2197=0A=
 __do_sys_sendto net/socket.c:2204 [inline]=0A=
 __se_sys_sendto net/socket.c:2200 [inline]=0A=
 __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2200=0A=
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]=0A=
 do_syscall_64+0xcb/0x250 arch/x86/entry/common.c:83=0A=
page last free pid 9440 tgid 9440 stack trace:=0A=
 reset_page_owner include/linux/page_owner.h:25 [inline]=0A=
 free_pages_prepare mm/page_alloc.c:1127 [inline]=0A=
 free_unref_page+0x714/0x10c0 mm/page_alloc.c:2657=0A=
 __put_partials+0x154/0x170 mm/slub.c:3142=0A=
 qlink_free mm/kasan/quarantine.c:163 [inline]=0A=
 qlist_free_all+0x50/0x120 mm/kasan/quarantine.c:179=0A=
 kasan_quarantine_reduce+0x195/0x1e0 mm/kasan/quarantine.c:286=0A=
 __kasan_slab_alloc+0x67/0x90 mm/kasan/common.c:329=0A=
 kasan_slab_alloc include/linux/kasan.h:250 [inline]=0A=
 slab_post_alloc_hook mm/slub.c:4104 [inline]=0A=
 slab_alloc_node mm/slub.c:4153 [inline]=0A=
 kmem_cache_alloc_noprof+0x167/0x3e0 mm/slub.c:4160=0A=
 skb_clone+0x16e/0x460 net/core/skbuff.c:2084=0A=
 hci_send_cmd_sync net/bluetooth/hci_core.c:4072 [inline]=0A=
 hci_cmd_work+0x1c5/0x750 net/bluetooth/hci_core.c:4108=0A=
 process_one_work+0x99f/0x1bb0 kernel/workqueue.c:3229=0A=
 process_scheduled_works kernel/workqueue.c:3310 [inline]=0A=
 worker_thread+0x66e/0xe80 kernel/workqueue.c:3391=0A=
 kthread+0x2c7/0x3b0 kernel/kthread.c:389=0A=
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147=0A=
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244=0A=
=0A=
Memory state around the buggy address:=0A=
 ffff8880483f7580: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
 ffff8880483f7600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
>ffff8880483f7680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ^=0A=
 ffff8880483f7700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
 ffff8880483f7780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
Po C.c=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
// autogenerated by syzkaller (https://github.com/google/syzkaller)=0A=
=0A=
#define _GNU_SOURCE=0A=
=0A=
#include <dirent.h>=0A=
#include <endian.h>=0A=
#include <errno.h>=0A=
#include <fcntl.h>=0A=
#include <signal.h>=0A=
#include <stdarg.h>=0A=
#include <stdbool.h>=0A=
#include <stddef.h>=0A=
#include <stdint.h>=0A=
#include <stdio.h>=0A=
#include <stdlib.h>=0A=
#include <string.h>=0A=
#include <sys/ioctl.h>=0A=
#include <sys/mount.h>=0A=
#include <sys/prctl.h>=0A=
#include <sys/stat.h>=0A=
#include <sys/syscall.h>=0A=
#include <sys/types.h>=0A=
#include <sys/wait.h>=0A=
#include <time.h>=0A=
#include <unistd.h>=0A=
=0A=
#include <linux/usb/ch9.h>=0A=
=0A=
static unsigned long long=A0procid;=0A=
=0A=
static void sleep_ms(uint64_t ms)=0A=
{=0A=
=A0 usleep(ms * 1000);=0A=
}=0A=
=0A=
static uint64_t current_time_ms(void)=0A=
{=0A=
=A0 struct=A0timespec ts;=0A=
=A0 if (clock_gettime(CLOCK_MONOTONIC, &ts))=0A=
=A0 =A0 exit(1);=0A=
=A0 return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;=0A=
}=0A=
=0A=
static void use_temporary_dir(void)=0A=
{=0A=
=A0 char=A0tmpdir_template[] =3D "./syzkaller.XXXXXX";=0A=
=A0 char*=A0tmpdir =3D mkdtemp(tmpdir_template);=0A=
=A0 if (!tmpdir)=0A=
=A0 =A0 exit(1);=0A=
=A0 if (chmod(tmpdir, 0777))=0A=
=A0 =A0 exit(1);=0A=
=A0 if (chdir(tmpdir))=0A=
=A0 =A0 exit(1);=0A=
}=0A=
=0A=
static bool write_file(const char* file, const char* what, ...)=0A=
{=0A=
=A0 char buf[1024];=0A=
=A0 va_list args;=0A=
=A0 va_start(args,=A0what);=0A=
=A0 vsnprintf(buf, sizeof(buf),=A0what,=A0args);=0A=
=A0 va_end(args);=0A=
=A0 buf[sizeof(buf) - 1] =3D 0;=0A=
=A0 int=A0len =3D strlen(buf);=0A=
=A0 int=A0fd =3D open(file,=A0O_WRONLY |=A0O_CLOEXEC);=0A=
=A0 if (fd =3D=3D -1)=0A=
=A0 =A0 return false;=0A=
=A0 if (write(fd,=A0buf,=A0len) !=3D=A0len) {=0A=
=A0 =A0 int=A0err =3D=A0errno;=0A=
=A0 =A0 close(fd);=0A=
=A0 =A0 errno =3D=A0err;=0A=
=A0 =A0 return false;=0A=
=A0 }=0A=
=A0 close(fd);=0A=
=A0 return true;=0A=
}=0A=
=0A=
#define MAX_FDS 30=0A=
=0A=
#define USB_MAX_IFACE_NUM 4=0A=
#define USB_MAX_EP_NUM 32=0A=
#define USB_MAX_FDS 6=0A=
=0A=
struct=A0usb_endpoint_index {=0A=
=A0 struct=A0usb_endpoint_descriptor desc;=0A=
=A0 int=A0handle;=0A=
};=0A=
=0A=
struct=A0usb_iface_index {=0A=
=A0 struct=A0usb_interface_descriptor*=A0iface;=0A=
=A0 uint8_t=A0bInterfaceNumber;=0A=
=A0 uint8_t=A0bAlternateSetting;=0A=
=A0 uint8_t=A0bInterfaceClass;=0A=
=A0 struct=A0usb_endpoint_index eps[USB_MAX_EP_NUM];=0A=
=A0 int=A0eps_num;=0A=
};=0A=
=0A=
struct=A0usb_device_index {=0A=
=A0 struct=A0usb_device_descriptor*=A0dev;=0A=
=A0 struct=A0usb_config_descriptor*=A0config;=0A=
=A0 uint8_t=A0bDeviceClass;=0A=
=A0 uint8_t=A0bMaxPower;=0A=
=A0 int=A0config_length;=0A=
=A0 struct=A0usb_iface_index ifaces[USB_MAX_IFACE_NUM];=0A=
=A0 int=A0ifaces_num;=0A=
=A0 int=A0iface_cur;=0A=
};=0A=
=0A=
struct=A0usb_info {=0A=
=A0 int=A0fd;=0A=
=A0 struct=A0usb_device_index index;=0A=
};=0A=
=0A=
static struct=A0usb_info usb_devices[USB_MAX_FDS];=0A=
=0A=
static struct=A0usb_device_index* lookup_usb_index(int fd)=0A=
{=0A=
=A0 for (int=A0i =3D 0;=A0i <=A0USB_MAX_FDS;=A0i++) {=0A=
=A0 =A0 if (__atomic_load_n(&usb_devices[i].fd,=A0__ATOMIC_ACQUIRE) =3D=3D=
=A0fd)=0A=
=A0 =A0 =A0 return &usb_devices[i].index;=0A=
=A0 }=0A=
=A0 return NULL;=0A=
}=0A=
=0A=
static int=A0usb_devices_num;=0A=
=0A=
static bool parse_usb_descriptor(const char* buffer, size_t length,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct=
=A0usb_device_index* index)=0A=
{=0A=
=A0 if (length < sizeof(*index->dev) + sizeof(*index->config))=0A=
=A0 =A0 return false;=0A=
=A0 memset(index, 0, sizeof(*index));=0A=
=A0 index->dev =3D (struct=A0usb_device_descriptor*)buffer;=0A=
=A0 index->config =3D (struct=A0usb_config_descriptor*)(buffer + sizeof(*in=
dex->dev));=0A=
=A0 index->bDeviceClass =3D index->dev->bDeviceClass;=0A=
=A0 index->bMaxPower =3D index->config->bMaxPower;=0A=
=A0 index->config_length =3D=A0length - sizeof(*index->dev);=0A=
=A0 index->iface_cur =3D -1;=0A=
=A0 size_t=A0offset =3D 0;=0A=
=A0 while (true) {=0A=
=A0 =A0 if (offset + 1 >=3D=A0length)=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 uint8_t=A0desc_length =3D buffer[offset];=0A=
=A0 =A0 uint8_t=A0desc_type =3D buffer[offset + 1];=0A=
=A0 =A0 if (desc_length <=3D 2)=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 if (offset +=A0desc_length >=A0length)=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 if (desc_type =3D=3D=A0USB_DT_INTERFACE &&=0A=
=A0 =A0 =A0 =A0 index->ifaces_num <=A0USB_MAX_IFACE_NUM) {=0A=
=A0 =A0 =A0 struct=A0usb_interface_descriptor*=A0iface =3D=0A=
=A0 =A0 =A0 =A0 =A0 (struct=A0usb_interface_descriptor*)(buffer +=A0offset)=
;=0A=
=A0 =A0 =A0 index->ifaces[index->ifaces_num].iface =3D=A0iface;=0A=
=A0 =A0 =A0 index->ifaces[index->ifaces_num].bInterfaceNumber =3D=0A=
=A0 =A0 =A0 =A0 =A0 iface->bInterfaceNumber;=0A=
=A0 =A0 =A0 index->ifaces[index->ifaces_num].bAlternateSetting =3D=0A=
=A0 =A0 =A0 =A0 =A0 iface->bAlternateSetting;=0A=
=A0 =A0 =A0 index->ifaces[index->ifaces_num].bInterfaceClass =3D iface->bIn=
terfaceClass;=0A=
=A0 =A0 =A0 index->ifaces_num++;=0A=
=A0 =A0 }=0A=
=A0 =A0 if (desc_type =3D=3D=A0USB_DT_ENDPOINT && index->ifaces_num > 0) {=
=0A=
=A0 =A0 =A0 struct=A0usb_iface_index*=A0iface =3D &index->ifaces[index->ifa=
ces_num - 1];=0A=
=A0 =A0 =A0 if (iface->eps_num <=A0USB_MAX_EP_NUM) {=0A=
=A0 =A0 =A0 =A0 memcpy(&iface->eps[iface->eps_num].desc,=A0buffer +=A0offse=
t,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(iface->eps[iface->eps_num].desc));=0A=
=A0 =A0 =A0 =A0 iface->eps_num++;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 offset +=3D=A0desc_length;=0A=
=A0 }=0A=
=A0 return true;=0A=
}=0A=
=0A=
static struct=A0usb_device_index* add_usb_index(int fd, const char* dev,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 size_t dev_len)=0A=
{=0A=
=A0 int=A0i =3D __atomic_fetch_add(&usb_devices_num, 1,=A0__ATOMIC_RELAXED)=
;=0A=
=A0 if (i >=3D=A0USB_MAX_FDS)=0A=
=A0 =A0 return NULL;=0A=
=A0 if (!parse_usb_descriptor(dev,=A0dev_len, &usb_devices[i].index))=0A=
=A0 =A0 return NULL;=0A=
=A0 __atomic_store_n(&usb_devices[i].fd,=A0fd,=A0__ATOMIC_RELEASE);=0A=
=A0 return &usb_devices[i].index;=0A=
}=0A=
=0A=
struct=A0vusb_connect_string_descriptor {=0A=
=A0 uint32_t=A0len;=0A=
=A0 char*=A0str;=0A=
} __attribute__((packed));=0A=
=0A=
struct=A0vusb_connect_descriptors {=0A=
=A0 uint32_t=A0qual_len;=0A=
=A0 char*=A0qual;=0A=
=A0 uint32_t=A0bos_len;=0A=
=A0 char*=A0bos;=0A=
=A0 uint32_t=A0strs_len;=0A=
=A0 struct=A0vusb_connect_string_descriptor strs[0];=0A=
} __attribute__((packed));=0A=
=0A=
static const char=A0default_string[] =3D {8,=A0USB_DT_STRING, 's', 0, 'y', =
0, 'z', 0};=0A=
=0A=
static const char=A0default_lang_id[] =3D {4,=A0USB_DT_STRING, 0x09, 0x04};=
=0A=
=0A=
static bool=0A=
lookup_connect_response_in(int fd, const struct=A0vusb_connect_descriptors*=
 descs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct=A0usb_c=
trlrequest* ctrl,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct=A0usb_qualifi=
er_descriptor* qual,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char** response_data=
, uint32_t* response_length)=0A=
{=0A=
=A0 struct=A0usb_device_index*=A0index =3D lookup_usb_index(fd);=0A=
=A0 uint8_t=A0str_idx;=0A=
=A0 if (!index)=0A=
=A0 =A0 return false;=0A=
=A0 switch (ctrl->bRequestType &=A0USB_TYPE_MASK) {=0A=
=A0 case=A0USB_TYPE_STANDARD:=0A=
=A0 =A0 switch (ctrl->bRequest) {=0A=
=A0 =A0 case=A0USB_REQ_GET_DESCRIPTOR:=0A=
=A0 =A0 =A0 switch (ctrl->wValue >> 8) {=0A=
=A0 =A0 =A0 case=A0USB_DT_DEVICE:=0A=
=A0 =A0 =A0 =A0 *response_data =3D (char*)index->dev;=0A=
=A0 =A0 =A0 =A0 *response_length =3D sizeof(*index->dev);=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 case=A0USB_DT_CONFIG:=0A=
=A0 =A0 =A0 =A0 *response_data =3D (char*)index->config;=0A=
=A0 =A0 =A0 =A0 *response_length =3D index->config_length;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 case=A0USB_DT_STRING:=0A=
=A0 =A0 =A0 =A0 str_idx =3D (uint8_t)ctrl->wValue;=0A=
=A0 =A0 =A0 =A0 if (descs &&=A0str_idx <=A0descs->strs_len) {=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D descs->strs[str_idx].str;=0A=
=A0 =A0 =A0 =A0 =A0 *response_length =3D descs->strs[str_idx].len;=0A=
=A0 =A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 if (str_idx =3D=3D 0) {=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D (char*)&default_lang_id[0];=0A=
=A0 =A0 =A0 =A0 =A0 *response_length =3D default_lang_id[0];=0A=
=A0 =A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 *response_data =3D (char*)&default_string[0];=0A=
=A0 =A0 =A0 =A0 *response_length =3D default_string[0];=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 case=A0USB_DT_BOS:=0A=
=A0 =A0 =A0 =A0 *response_data =3D descs->bos;=0A=
=A0 =A0 =A0 =A0 *response_length =3D descs->bos_len;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 case=A0USB_DT_DEVICE_QUALIFIER:=0A=
=A0 =A0 =A0 =A0 if (!descs->qual) {=0A=
=A0 =A0 =A0 =A0 =A0 qual->bLength =3D sizeof(*qual);=0A=
=A0 =A0 =A0 =A0 =A0 qual->bDescriptorType =3D=A0USB_DT_DEVICE_QUALIFIER;=0A=
=A0 =A0 =A0 =A0 =A0 qual->bcdUSB =3D index->dev->bcdUSB;=0A=
=A0 =A0 =A0 =A0 =A0 qual->bDeviceClass =3D index->dev->bDeviceClass;=0A=
=A0 =A0 =A0 =A0 =A0 qual->bDeviceSubClass =3D index->dev->bDeviceSubClass;=
=0A=
=A0 =A0 =A0 =A0 =A0 qual->bDeviceProtocol =3D index->dev->bDeviceProtocol;=
=0A=
=A0 =A0 =A0 =A0 =A0 qual->bMaxPacketSize0 =3D index->dev->bMaxPacketSize0;=
=0A=
=A0 =A0 =A0 =A0 =A0 qual->bNumConfigurations =3D index->dev->bNumConfigurat=
ions;=0A=
=A0 =A0 =A0 =A0 =A0 qual->bRESERVED =3D 0;=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D (char*)qual;=0A=
=A0 =A0 =A0 =A0 =A0 *response_length =3D sizeof(*qual);=0A=
=A0 =A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 *response_data =3D descs->qual;=0A=
=A0 =A0 =A0 =A0 *response_length =3D descs->qual_len;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 default:=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 default:=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 }=0A=
=A0 =A0 break;=0A=
=A0 default:=0A=
=A0 =A0 break;=0A=
=A0 }=0A=
=A0 return false;=0A=
}=0A=
=0A=
typedef bool (*lookup_connect_out_response_t)(=0A=
=A0 =A0 int=A0fd, const struct=A0vusb_connect_descriptors*=A0descs,=0A=
=A0 =A0 const struct=A0usb_ctrlrequest*=A0ctrl, bool*=A0done);=0A=
=0A=
static bool lookup_connect_response_out_generic(=0A=
=A0 =A0 int fd, const struct=A0vusb_connect_descriptors* descs,=0A=
=A0 =A0 const struct=A0usb_ctrlrequest* ctrl, bool* done)=0A=
{=0A=
=A0 switch (ctrl->bRequestType &=A0USB_TYPE_MASK) {=0A=
=A0 case=A0USB_TYPE_STANDARD:=0A=
=A0 =A0 switch (ctrl->bRequest) {=0A=
=A0 =A0 case=A0USB_REQ_SET_CONFIGURATION:=0A=
=A0 =A0 =A0 *done =3D true;=0A=
=A0 =A0 =A0 return true;=0A=
=A0 =A0 default:=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 }=0A=
=A0 =A0 break;=0A=
=A0 }=0A=
=A0 return false;=0A=
}=0A=
=0A=
struct=A0vusb_descriptor {=0A=
=A0 uint8_t=A0req_type;=0A=
=A0 uint8_t=A0desc_type;=0A=
=A0 uint32_t=A0len;=0A=
=A0 char data[0];=0A=
} __attribute__((packed));=0A=
=0A=
struct=A0vusb_descriptors {=0A=
=A0 uint32_t=A0len;=0A=
=A0 struct=A0vusb_descriptor*=A0generic;=0A=
=A0 struct=A0vusb_descriptor* descs[0];=0A=
} __attribute__((packed));=0A=
=0A=
struct=A0vusb_response {=0A=
=A0 uint8_t=A0type;=0A=
=A0 uint8_t=A0req;=0A=
=A0 uint32_t=A0len;=0A=
=A0 char data[0];=0A=
} __attribute__((packed));=0A=
=0A=
struct=A0vusb_responses {=0A=
=A0 uint32_t=A0len;=0A=
=A0 struct=A0vusb_response*=A0generic;=0A=
=A0 struct=A0vusb_response* resps[0];=0A=
} __attribute__((packed));=0A=
=0A=
static bool lookup_control_response(const struct=A0vusb_descriptors* descs,=
=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 con=
st struct=A0vusb_responses* resps,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct=A0usb_ctrlrequest* ctrl,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cha=
r** response_data,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uin=
t32_t* response_length)=0A=
{=0A=
=A0 int=A0descs_num =3D 0;=0A=
=A0 int=A0resps_num =3D 0;=0A=
=A0 if (descs)=0A=
=A0 =A0 descs_num =3D (descs->len - offsetof(struct=A0vusb_descriptors,=A0d=
escs)) /=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(descs->descs[0]);=0A=
=A0 if (resps)=0A=
=A0 =A0 resps_num =3D (resps->len - offsetof(struct=A0vusb_responses,=A0res=
ps)) /=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(resps->resps[0]);=0A=
=A0 uint8_t=A0req =3D ctrl->bRequest;=0A=
=A0 uint8_t=A0req_type =3D ctrl->bRequestType &=A0USB_TYPE_MASK;=0A=
=A0 uint8_t=A0desc_type =3D ctrl->wValue >> 8;=0A=
=A0 if (req =3D=3D=A0USB_REQ_GET_DESCRIPTOR) {=0A=
=A0 =A0 int=A0i;=0A=
=A0 =A0 for (i =3D 0;=A0i <=A0descs_num;=A0i++) {=0A=
=A0 =A0 =A0 struct=A0vusb_descriptor*=A0desc =3D descs->descs[i];=0A=
=A0 =A0 =A0 if (!desc)=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 if (desc->req_type =3D=3D=A0req_type && desc->desc_type =3D=3D=
=A0desc_type) {=0A=
=A0 =A0 =A0 =A0 *response_length =3D desc->len;=0A=
=A0 =A0 =A0 =A0 if (*response_length !=3D 0)=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D &desc->data[0];=0A=
=A0 =A0 =A0 =A0 else=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D NULL;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 if (descs && descs->generic) {=0A=
=A0 =A0 =A0 *response_data =3D &descs->generic->data[0];=0A=
=A0 =A0 =A0 *response_length =3D descs->generic->len;=0A=
=A0 =A0 =A0 return true;=0A=
=A0 =A0 }=0A=
=A0 } else {=0A=
=A0 =A0 int=A0i;=0A=
=A0 =A0 for (i =3D 0;=A0i <=A0resps_num;=A0i++) {=0A=
=A0 =A0 =A0 struct=A0vusb_response*=A0resp =3D resps->resps[i];=0A=
=A0 =A0 =A0 if (!resp)=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 if (resp->type =3D=3D=A0req_type && resp->req =3D=3D=A0req) {=
=0A=
=A0 =A0 =A0 =A0 *response_length =3D resp->len;=0A=
=A0 =A0 =A0 =A0 if (*response_length !=3D 0)=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D &resp->data[0];=0A=
=A0 =A0 =A0 =A0 else=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D NULL;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 if (resps && resps->generic) {=0A=
=A0 =A0 =A0 *response_data =3D &resps->generic->data[0];=0A=
=A0 =A0 =A0 *response_length =3D resps->generic->len;=0A=
=A0 =A0 =A0 return true;=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 return false;=0A=
}=0A=
=0A=
#define UDC_NAME_LENGTH_MAX 128=0A=
=0A=
struct=A0usb_raw_init {=0A=
=A0 __u8 driver_name[UDC_NAME_LENGTH_MAX];=0A=
=A0 __u8 device_name[UDC_NAME_LENGTH_MAX];=0A=
=A0 __u8 speed;=0A=
};=0A=
=0A=
enum=A0usb_raw_event_type {=0A=
=A0 USB_RAW_EVENT_INVALID =3D 0,=0A=
=A0 USB_RAW_EVENT_CONNECT =3D 1,=0A=
=A0 USB_RAW_EVENT_CONTROL =3D 2,=0A=
};=0A=
=0A=
struct=A0usb_raw_event {=0A=
=A0 __u32 type;=0A=
=A0 __u32 length;=0A=
=A0 __u8 data[0];=0A=
};=0A=
=0A=
struct=A0usb_raw_ep_io {=0A=
=A0 __u16 ep;=0A=
=A0 __u16 flags;=0A=
=A0 __u32 length;=0A=
=A0 __u8 data[0];=0A=
};=0A=
=0A=
#define USB_RAW_EPS_NUM_MAX 30=0A=
#define USB_RAW_EP_NAME_MAX 16=0A=
#define USB_RAW_EP_ADDR_ANY 0xff=0A=
=0A=
struct=A0usb_raw_ep_caps {=0A=
=A0 __u32 type_control : 1;=0A=
=A0 __u32 type_iso : 1;=0A=
=A0 __u32 type_bulk : 1;=0A=
=A0 __u32 type_int : 1;=0A=
=A0 __u32 dir_in : 1;=0A=
=A0 __u32 dir_out : 1;=0A=
};=0A=
=0A=
struct=A0usb_raw_ep_limits {=0A=
=A0 __u16 maxpacket_limit;=0A=
=A0 __u16 max_streams;=0A=
=A0 __u32 reserved;=0A=
};=0A=
=0A=
struct=A0usb_raw_ep_info {=0A=
=A0 __u8 name[USB_RAW_EP_NAME_MAX];=0A=
=A0 __u32 addr;=0A=
=A0 struct=A0usb_raw_ep_caps caps;=0A=
=A0 struct=A0usb_raw_ep_limits limits;=0A=
};=0A=
=0A=
struct=A0usb_raw_eps_info {=0A=
=A0 struct=A0usb_raw_ep_info eps[USB_RAW_EPS_NUM_MAX];=0A=
};=0A=
=0A=
#define USB_RAW_IOCTL_INIT _IOW('U', 0, struct=A0usb_raw_init)=0A=
#define USB_RAW_IOCTL_RUN _IO('U', 1)=0A=
#define USB_RAW_IOCTL_EVENT_FETCH _IOR('U', 2, struct=A0usb_raw_event)=0A=
#define USB_RAW_IOCTL_EP0_WRITE _IOW('U', 3, struct=A0usb_raw_ep_io)=0A=
#define USB_RAW_IOCTL_EP0_READ _IOWR('U', 4, struct=A0usb_raw_ep_io)=0A=
#define USB_RAW_IOCTL_EP_ENABLE _IOW('U', 5, struct=A0usb_endpoint_descript=
or)=0A=
#define USB_RAW_IOCTL_EP_DISABLE _IOW('U', 6,=A0__u32)=0A=
#define USB_RAW_IOCTL_EP_WRITE _IOW('U', 7, struct=A0usb_raw_ep_io)=0A=
#define USB_RAW_IOCTL_EP_READ _IOWR('U', 8, struct=A0usb_raw_ep_io)=0A=
#define USB_RAW_IOCTL_CONFIGURE _IO('U', 9)=0A=
#define USB_RAW_IOCTL_VBUS_DRAW _IOW('U', 10,=A0__u32)=0A=
#define USB_RAW_IOCTL_EPS_INFO _IOR('U', 11, struct=A0usb_raw_eps_info)=0A=
#define USB_RAW_IOCTL_EP0_STALL _IO('U', 12)=0A=
#define USB_RAW_IOCTL_EP_SET_HALT _IOW('U', 13,=A0__u32)=0A=
#define USB_RAW_IOCTL_EP_CLEAR_HALT _IOW('U', 14,=A0__u32)=0A=
#define USB_RAW_IOCTL_EP_SET_WEDGE _IOW('U', 15,=A0__u32)=0A=
=0A=
static int usb_raw_open()=0A=
{=0A=
=A0 return open("/dev/raw-gadget",=A0O_RDWR);=0A=
}=0A=
=0A=
static int usb_raw_init(int fd, uint32_t speed, const char* driver,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char* device)=0A=
{=0A=
=A0 struct=A0usb_raw_init arg;=0A=
=A0 strncpy((char*)&arg.driver_name[0],=A0driver, sizeof(arg.driver_name));=
=0A=
=A0 strncpy((char*)&arg.device_name[0],=A0device, sizeof(arg.device_name));=
=0A=
=A0 arg.speed =3D=A0speed;=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_INIT, &arg);=0A=
}=0A=
=0A=
static int usb_raw_run(int fd)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_RUN, 0);=0A=
}=0A=
=0A=
static int usb_raw_configure(int fd)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_CONFIGURE, 0);=0A=
}=0A=
=0A=
static int usb_raw_vbus_draw(int fd, uint32_t power)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_VBUS_DRAW,=A0power);=0A=
}=0A=
=0A=
static int usb_raw_ep0_write(int fd, struct=A0usb_raw_ep_io* io)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP0_WRITE,=A0io);=0A=
}=0A=
=0A=
static int usb_raw_ep0_read(int fd, struct=A0usb_raw_ep_io* io)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP0_READ,=A0io);=0A=
}=0A=
=0A=
static int usb_raw_event_fetch(int fd, struct=A0usb_raw_event* event)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EVENT_FETCH,=A0event);=0A=
}=0A=
=0A=
static int usb_raw_ep_enable(int fd, struct=A0usb_endpoint_descriptor* desc=
)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP_ENABLE,=A0desc);=0A=
}=0A=
=0A=
static int usb_raw_ep_disable(int fd, int ep)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP_DISABLE,=A0ep);=0A=
}=0A=
=0A=
static int usb_raw_ep0_stall(int fd)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP0_STALL, 0);=0A=
}=0A=
=0A=
static int lookup_interface(int fd, uint8_t bInterfaceNumber,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t bAlternateS=
etting)=0A=
{=0A=
=A0 struct=A0usb_device_index*=A0index =3D lookup_usb_index(fd);=0A=
=A0 if (!index)=0A=
=A0 =A0 return -1;=0A=
=A0 for (int=A0i =3D 0;=A0i < index->ifaces_num;=A0i++) {=0A=
=A0 =A0 if (index->ifaces[i].bInterfaceNumber =3D=3D=A0bInterfaceNumber &&=
=0A=
=A0 =A0 =A0 =A0 index->ifaces[i].bAlternateSetting =3D=3D=A0bAlternateSetti=
ng)=0A=
=A0 =A0 =A0 return=A0i;=0A=
=A0 }=0A=
=A0 return -1;=0A=
}=0A=
=0A=
#define USB_MAX_PACKET_SIZE 4096=0A=
=0A=
struct=A0usb_raw_control_event {=0A=
=A0 struct=A0usb_raw_event inner;=0A=
=A0 struct=A0usb_ctrlrequest ctrl;=0A=
=A0 char data[USB_MAX_PACKET_SIZE];=0A=
};=0A=
=0A=
struct=A0usb_raw_ep_io_data {=0A=
=A0 struct=A0usb_raw_ep_io inner;=0A=
=A0 char data[USB_MAX_PACKET_SIZE];=0A=
};=0A=
=0A=
static void set_interface(int fd, int n)=0A=
{=0A=
=A0 struct=A0usb_device_index*=A0index =3D lookup_usb_index(fd);=0A=
=A0 if (!index)=0A=
=A0 =A0 return;=0A=
=A0 if (index->iface_cur >=3D 0 && index->iface_cur < index->ifaces_num) {=
=0A=
=A0 =A0 for (int=A0ep =3D 0;=A0ep < index->ifaces[index->iface_cur].eps_num=
;=A0ep++) {=0A=
=A0 =A0 =A0 int=A0rv =3D usb_raw_ep_disable(=0A=
=A0 =A0 =A0 =A0 =A0 fd, index->ifaces[index->iface_cur].eps[ep].handle);=0A=
=A0 =A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 } else {=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 if (n >=3D 0 &&=A0n < index->ifaces_num) {=0A=
=A0 =A0 for (int=A0ep =3D 0;=A0ep < index->ifaces[n].eps_num;=A0ep++) {=0A=
=A0 =A0 =A0 int=A0rv =3D usb_raw_ep_enable(fd, &index->ifaces[n].eps[ep].de=
sc);=0A=
=A0 =A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 } else {=0A=
=A0 =A0 =A0 =A0 index->ifaces[n].eps[ep].handle =3D=A0rv;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 index->iface_cur =3D=A0n;=0A=
=A0 }=0A=
}=0A=
=0A=
static int configure_device(int fd)=0A=
{=0A=
=A0 struct=A0usb_device_index*=A0index =3D lookup_usb_index(fd);=0A=
=A0 if (!index)=0A=
=A0 =A0 return -1;=0A=
=A0 int=A0rv =3D usb_raw_vbus_draw(fd, index->bMaxPower);=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 rv =3D usb_raw_configure(fd);=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 set_interface(fd, 0);=0A=
=A0 return 0;=0A=
}=0A=
=0A=
static volatile long=0A=
syz_usb_connect_impl(uint64_t speed, uint64_t dev_len, const char* dev,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct=A0vusb_connect_desc=
riptors* descs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lookup_connect_out_response_t lo=
okup_connect_response_out)=0A=
{=0A=
=A0 if (!dev) {=0A=
=A0 =A0 return -1;=0A=
=A0 }=0A=
=A0 int=A0fd =3D usb_raw_open();=0A=
=A0 if (fd < 0) {=0A=
=A0 =A0 return=A0fd;=0A=
=A0 }=0A=
=A0 if (fd >=3D=A0MAX_FDS) {=0A=
=A0 =A0 close(fd);=0A=
=A0 =A0 return -1;=0A=
=A0 }=0A=
=A0 struct=A0usb_device_index*=A0index =3D add_usb_index(fd,=A0dev,=A0dev_l=
en);=0A=
=A0 if (!index) {=0A=
=A0 =A0 return -1;=0A=
=A0 }=0A=
=A0 char device[32];=0A=
=A0 sprintf(&device[0], "dummy_udc.%llu",=A0procid);=0A=
=A0 int=A0rv =3D usb_raw_init(fd,=A0speed, "dummy_udc", &device[0]);=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 rv =3D usb_raw_run(fd);=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 bool=A0done =3D false;=0A=
=A0 while (!done) {=0A=
=A0 =A0 struct=A0usb_raw_control_event event;=0A=
=A0 =A0 event.inner.type =3D 0;=0A=
=A0 =A0 event.inner.length =3D sizeof(event.ctrl);=0A=
=A0 =A0 rv =3D usb_raw_event_fetch(fd, (struct=A0usb_raw_event*)&event);=0A=
=A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 return=A0rv;=0A=
=A0 =A0 }=0A=
=A0 =A0 if (event.inner.type !=3D=A0USB_RAW_EVENT_CONTROL)=0A=
=A0 =A0 =A0 continue;=0A=
=A0 =A0 char*=A0response_data =3D NULL;=0A=
=A0 =A0 uint32_t=A0response_length =3D 0;=0A=
=A0 =A0 struct=A0usb_qualifier_descriptor qual;=0A=
=A0 =A0 if (event.ctrl.bRequestType &=A0USB_DIR_IN) {=0A=
=A0 =A0 =A0 if (!lookup_connect_response_in(fd,=A0descs, &event.ctrl, &qual=
,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 &response_data, &response_length)) {=0A=
=A0 =A0 =A0 =A0 usb_raw_ep0_stall(fd);=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 } else {=0A=
=A0 =A0 =A0 if (!lookup_connect_response_out(fd,=A0descs, &event.ctrl, &don=
e)) {=0A=
=A0 =A0 =A0 =A0 usb_raw_ep0_stall(fd);=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 response_data =3D NULL;=0A=
=A0 =A0 =A0 response_length =3D event.ctrl.wLength;=0A=
=A0 =A0 }=0A=
=A0 =A0 if ((event.ctrl.bRequestType &=A0USB_TYPE_MASK) =3D=3D=A0USB_TYPE_S=
TANDARD &&=0A=
=A0 =A0 =A0 =A0 event.ctrl.bRequest =3D=3D=A0USB_REQ_SET_CONFIGURATION) {=
=0A=
=A0 =A0 =A0 rv =3D configure_device(fd);=0A=
=A0 =A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 =A0 return=A0rv;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 struct=A0usb_raw_ep_io_data response;=0A=
=A0 =A0 response.inner.ep =3D 0;=0A=
=A0 =A0 response.inner.flags =3D 0;=0A=
=A0 =A0 if (response_length > sizeof(response.data))=0A=
=A0 =A0 =A0 response_length =3D 0;=0A=
=A0 =A0 if (event.ctrl.wLength <=A0response_length)=0A=
=A0 =A0 =A0 response_length =3D event.ctrl.wLength;=0A=
=A0 =A0 response.inner.length =3D=A0response_length;=0A=
=A0 =A0 if (response_data)=0A=
=A0 =A0 =A0 memcpy(&response.data[0],=A0response_data,=A0response_length);=
=0A=
=A0 =A0 else=0A=
=A0 =A0 =A0 memset(&response.data[0], 0,=A0response_length);=0A=
=A0 =A0 if (event.ctrl.bRequestType &=A0USB_DIR_IN) {=0A=
=A0 =A0 =A0 rv =3D usb_raw_ep0_write(fd, (struct=A0usb_raw_ep_io*)&response=
);=0A=
=A0 =A0 } else {=0A=
=A0 =A0 =A0 rv =3D usb_raw_ep0_read(fd, (struct=A0usb_raw_ep_io*)&response)=
;=0A=
=A0 =A0 }=0A=
=A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 return=A0rv;=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 sleep_ms(200);=0A=
=A0 return=A0fd;=0A=
}=0A=
=0A=
static volatile long syz_usb_connect(volatile long a0, volatile long a1,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
volatile long a2, volatile long a3)=0A=
{=0A=
=A0 uint64_t=A0speed =3D=A0a0;=0A=
=A0 uint64_t=A0dev_len =3D=A0a1;=0A=
=A0 const char*=A0dev =3D (const char*)a2;=0A=
=A0 const struct=A0vusb_connect_descriptors*=A0descs =3D=0A=
=A0 =A0 =A0 (const struct=A0vusb_connect_descriptors*)a3;=0A=
=A0 return syz_usb_connect_impl(speed,=A0dev_len,=A0dev,=A0descs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &lookup_connect=
_response_out_generic);=0A=
}=0A=
=0A=
static volatile long syz_usb_control_io(volatile long a0, volatile long a1,=
=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 volatile long a2)=0A=
{=0A=
=A0 int=A0fd =3D=A0a0;=0A=
=A0 const struct=A0vusb_descriptors*=A0descs =3D (const struct=A0vusb_descr=
iptors*)a1;=0A=
=A0 const struct=A0vusb_responses*=A0resps =3D (const struct=A0vusb_respons=
es*)a2;=0A=
=A0 struct=A0usb_raw_control_event event;=0A=
=A0 event.inner.type =3D 0;=0A=
=A0 event.inner.length =3D=A0USB_MAX_PACKET_SIZE;=0A=
=A0 int=A0rv =3D usb_raw_event_fetch(fd, (struct=A0usb_raw_event*)&event);=
=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 if (event.inner.type !=3D=A0USB_RAW_EVENT_CONTROL) {=0A=
=A0 =A0 return -1;=0A=
=A0 }=0A=
=A0 char*=A0response_data =3D NULL;=0A=
=A0 uint32_t=A0response_length =3D 0;=0A=
=A0 if ((event.ctrl.bRequestType &=A0USB_DIR_IN) && event.ctrl.wLength) {=
=0A=
=A0 =A0 if (!lookup_control_response(descs,=A0resps, &event.ctrl, &response=
_data,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&respons=
e_length)) {=0A=
=A0 =A0 =A0 usb_raw_ep0_stall(fd);=0A=
=A0 =A0 =A0 return -1;=0A=
=A0 =A0 }=0A=
=A0 } else {=0A=
=A0 =A0 if ((event.ctrl.bRequestType &=A0USB_TYPE_MASK) =3D=3D=A0USB_TYPE_S=
TANDARD ||=0A=
=A0 =A0 =A0 =A0 event.ctrl.bRequest =3D=3D=A0USB_REQ_SET_INTERFACE) {=0A=
=A0 =A0 =A0 int=A0iface_num =3D event.ctrl.wIndex;=0A=
=A0 =A0 =A0 int=A0alt_set =3D event.ctrl.wValue;=0A=
=A0 =A0 =A0 int=A0iface_index =3D lookup_interface(fd,=A0iface_num,=A0alt_s=
et);=0A=
=A0 =A0 =A0 if (iface_index < 0) {=0A=
=A0 =A0 =A0 } else {=0A=
=A0 =A0 =A0 =A0 set_interface(fd,=A0iface_index);=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 response_length =3D event.ctrl.wLength;=0A=
=A0 }=0A=
=A0 struct=A0usb_raw_ep_io_data response;=0A=
=A0 response.inner.ep =3D 0;=0A=
=A0 response.inner.flags =3D 0;=0A=
=A0 if (response_length > sizeof(response.data))=0A=
=A0 =A0 response_length =3D 0;=0A=
=A0 if (event.ctrl.wLength <=A0response_length)=0A=
=A0 =A0 response_length =3D event.ctrl.wLength;=0A=
=A0 if ((event.ctrl.bRequestType &=A0USB_DIR_IN) && !event.ctrl.wLength) {=
=0A=
=A0 =A0 response_length =3D=A0USB_MAX_PACKET_SIZE;=0A=
=A0 }=0A=
=A0 response.inner.length =3D=A0response_length;=0A=
=A0 if (response_data)=0A=
=A0 =A0 memcpy(&response.data[0],=A0response_data,=A0response_length);=0A=
=A0 else=0A=
=A0 =A0 memset(&response.data[0], 0,=A0response_length);=0A=
=A0 if ((event.ctrl.bRequestType &=A0USB_DIR_IN) && event.ctrl.wLength) {=
=0A=
=A0 =A0 rv =3D usb_raw_ep0_write(fd, (struct=A0usb_raw_ep_io*)&response);=
=0A=
=A0 } else {=0A=
=A0 =A0 rv =3D usb_raw_ep0_read(fd, (struct=A0usb_raw_ep_io*)&response);=0A=
=A0 }=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 sleep_ms(200);=0A=
=A0 return 0;=0A=
}=0A=
=0A=
#define FS_IOC_SETFLAGS _IOW('f', 2, long)=0A=
static void remove_dir(const char* dir)=0A=
{=0A=
=A0 int=A0iter =3D 0;=0A=
=A0 DIR*=A0dp =3D 0;=0A=
=A0 const int=A0umount_flags =3D=A0MNT_FORCE |=A0UMOUNT_NOFOLLOW;=0A=
=0A=
retry:=0A=
=A0 while (umount2(dir,=A0umount_flags) =3D=3D 0) {=0A=
=A0 }=0A=
=A0 dp =3D opendir(dir);=0A=
=A0 if (dp =3D=3D NULL) {=0A=
=A0 =A0 if (errno =3D=3D=A0EMFILE) {=0A=
=A0 =A0 =A0 exit(1);=0A=
=A0 =A0 }=0A=
=A0 =A0 exit(1);=0A=
=A0 }=0A=
=A0 struct=A0dirent*=A0ep =3D 0;=0A=
=A0 while ((ep =3D readdir(dp))) {=0A=
=A0 =A0 if (strcmp(ep->d_name, ".") =3D=3D 0 || strcmp(ep->d_name, "..") =
=3D=3D 0)=0A=
=A0 =A0 =A0 continue;=0A=
=A0 =A0 char filename[FILENAME_MAX];=0A=
=A0 =A0 snprintf(filename, sizeof(filename), "%s/%s",=A0dir, ep->d_name);=
=0A=
=A0 =A0 while (umount2(filename,=A0umount_flags) =3D=3D 0) {=0A=
=A0 =A0 }=0A=
=A0 =A0 struct=A0stat st;=0A=
=A0 =A0 if (lstat(filename, &st))=0A=
=A0 =A0 =A0 exit(1);=0A=
=A0 =A0 if (S_ISDIR(st.st_mode)) {=0A=
=A0 =A0 =A0 remove_dir(filename);=0A=
=A0 =A0 =A0 continue;=0A=
=A0 =A0 }=0A=
=A0 =A0 int=A0i;=0A=
=A0 =A0 for (i =3D 0;;=A0i++) {=0A=
=A0 =A0 =A0 if (unlink(filename) =3D=3D 0)=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EPERM) {=0A=
=A0 =A0 =A0 =A0 int=A0fd =3D open(filename,=A0O_RDONLY);=0A=
=A0 =A0 =A0 =A0 if (fd !=3D -1) {=0A=
=A0 =A0 =A0 =A0 =A0 long=A0flags =3D 0;=0A=
=A0 =A0 =A0 =A0 =A0 if (ioctl(fd,=A0FS_IOC_SETFLAGS, &flags) =3D=3D 0) {=0A=
=A0 =A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 =A0 close(fd);=0A=
=A0 =A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EROFS) {=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno !=3D=A0EBUSY ||=A0i > 100)=0A=
=A0 =A0 =A0 =A0 exit(1);=0A=
=A0 =A0 =A0 if (umount2(filename,=A0umount_flags))=0A=
=A0 =A0 =A0 =A0 exit(1);=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 closedir(dp);=0A=
=A0 for (int=A0i =3D 0;;=A0i++) {=0A=
=A0 =A0 if (rmdir(dir) =3D=3D 0)=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 if (i < 100) {=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EPERM) {=0A=
=A0 =A0 =A0 =A0 int=A0fd =3D open(dir,=A0O_RDONLY);=0A=
=A0 =A0 =A0 =A0 if (fd !=3D -1) {=0A=
=A0 =A0 =A0 =A0 =A0 long=A0flags =3D 0;=0A=
=A0 =A0 =A0 =A0 =A0 if (ioctl(fd,=A0FS_IOC_SETFLAGS, &flags) =3D=3D 0) {=0A=
=A0 =A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 =A0 close(fd);=0A=
=A0 =A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EROFS) {=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EBUSY) {=0A=
=A0 =A0 =A0 =A0 if (umount2(dir,=A0umount_flags))=0A=
=A0 =A0 =A0 =A0 =A0 exit(1);=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0ENOTEMPTY) {=0A=
=A0 =A0 =A0 =A0 if (iter < 100) {=0A=
=A0 =A0 =A0 =A0 =A0 iter++;=0A=
=A0 =A0 =A0 =A0 =A0 goto=A0retry;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 exit(1);=0A=
=A0 }=0A=
}=0A=
=0A=
static void kill_and_wait(int pid, int* status)=0A=
{=0A=
=A0 kill(-pid,=A0SIGKILL);=0A=
=A0 kill(pid,=A0SIGKILL);=0A=
=A0 for (int=A0i =3D 0;=A0i < 100;=A0i++) {=0A=
=A0 =A0 if (waitpid(-1,=A0status,=A0WNOHANG |=A0__WALL) =3D=3D=A0pid)=0A=
=A0 =A0 =A0 return;=0A=
=A0 =A0 usleep(1000);=0A=
=A0 }=0A=
=A0 DIR*=A0dir =3D opendir("/sys/fs/fuse/connections");=0A=
=A0 if (dir) {=0A=
=A0 =A0 for (;;) {=0A=
=A0 =A0 =A0 struct=A0dirent*=A0ent =3D readdir(dir);=0A=
=A0 =A0 =A0 if (!ent)=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 if (strcmp(ent->d_name, ".") =3D=3D 0 || strcmp(ent->d_name, ".=
.") =3D=3D 0)=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 char abort[300];=0A=
=A0 =A0 =A0 snprintf(abort, sizeof(abort), "/sys/fs/fuse/connections/%s/abo=
rt",=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ent->d_name);=0A=
=A0 =A0 =A0 int=A0fd =3D open(abort,=A0O_WRONLY);=0A=
=A0 =A0 =A0 if (fd =3D=3D -1) {=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (write(fd,=A0abort, 1) < 0) {=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 close(fd);=0A=
=A0 =A0 }=0A=
=A0 =A0 closedir(dir);=0A=
=A0 } else {=0A=
=A0 }=0A=
=A0 while (waitpid(-1,=A0status,=A0__WALL) !=3D=A0pid) {=0A=
=A0 }=0A=
}=0A=
=0A=
static void setup_test()=0A=
{=0A=
=A0 prctl(PR_SET_PDEATHSIG,=A0SIGKILL, 0, 0, 0);=0A=
=A0 setpgrp();=0A=
=A0 write_file("/proc/self/oom_score_adj", "1000");=0A=
=A0 if (symlink("/dev/binderfs", "./binderfs")) {=0A=
=A0 }=0A=
}=0A=
=0A=
static void execute_one(void);=0A=
=0A=
#define WAIT_FLAGS=A0__WALL=0A=
=0A=
static void loop(void)=0A=
{=0A=
=A0 int=A0iter =3D 0;=0A=
=A0 for (;;=A0iter++) {=0A=
=A0 =A0 char cwdbuf[32];=0A=
=A0 =A0 sprintf(cwdbuf, "./%d",=A0iter);=0A=
=A0 =A0 if (mkdir(cwdbuf, 0777))=0A=
=A0 =A0 =A0 exit(1);=0A=
=A0 =A0 int=A0pid =3D fork();=0A=
=A0 =A0 if (pid < 0)=0A=
=A0 =A0 =A0 exit(1);=0A=
=A0 =A0 if (pid =3D=3D 0) {=0A=
=A0 =A0 =A0 if (chdir(cwdbuf))=0A=
=A0 =A0 =A0 =A0 exit(1);=0A=
=A0 =A0 =A0 setup_test();=0A=
=A0 =A0 =A0 execute_one();=0A=
=A0 =A0 =A0 exit(0);=0A=
=A0 =A0 }=0A=
=A0 =A0 int=A0status =3D 0;=0A=
=A0 =A0 uint64_t=A0start =3D current_time_ms();=0A=
=A0 =A0 for (;;) {=0A=
=A0 =A0 =A0 sleep_ms(10);=0A=
=A0 =A0 =A0 if (waitpid(-1, &status,=A0WNOHANG |=A0WAIT_FLAGS) =3D=3D=A0pid=
)=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 if (current_time_ms() -=A0start < 5000)=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 kill_and_wait(pid, &status);=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 }=0A=
=A0 =A0 remove_dir(cwdbuf);=0A=
=A0 }=0A=
}=0A=
=0A=
uint64_t r[1] =3D {0xffffffffffffffff};=0A=
=0A=
void execute_one(void)=0A=
{=0A=
=A0 intptr_t=A0res =3D 0;=0A=
=A0 if (write(1, "executing program\n", sizeof("executing program\n") - 1))=
 {=0A=
=A0 }=0A=
=A0 *(uint64_t*)0x20000200 =3D 0;=0A=
=A0 memcpy((void*)0x20000208,=0A=
=A0 =A0 =A0 =A0 =A0"\x99\x21\x50\x23\x42\x9a\xb7\x3e\xd3\x03\xe6\x20\x15\x1=
a\xe6\x0e\xe2"=0A=
=A0 =A0 =A0 =A0 =A0"\x13\x1c\x5d\x61\xb3\xd1\xb5\x3b\x48\x7f\x98\x47\xfc\x1=
e\x89\xd0\x08"=0A=
=A0 =A0 =A0 =A0 =A0"\xb9\xa4\xc8\xa0\x87\xf0\xc6\x30\x1a\x80\xd4\xbb\xd0\x4=
2\xdd\xd0\x29"=0A=
=A0 =A0 =A0 =A0 =A0"\xd9\x84\x3f\x26\xb1\x1b\x62\x57",=0A=
=A0 =A0 =A0 =A0 =A059);=0A=
=A0 syscall(__NR_msgsnd,=A0/*msqid=3D*/0,=A0/*msgp=3D*/0x20000200ul,=A0/*sz=
=3D*/0x43ul,=0A=
=A0 =A0 =A0 =A0 =A0 /*flags=3DIPC_NOWAIT*/ 0x800ul);=0A=
=A0 memcpy((void*)0x20000040,=0A=
=A0 =A0 =A0 =A0 =A0"\x12\x01\x00\x02\x00\x00\x00\x40\x1c\x1b\x2a\x1b\x00\x0=
0\x00\x00\x00"=0A=
=A0 =A0 =A0 =A0 =A0"\x01\x09\x02\x24\x00\x01\x00\x00\x00\x03\x09\x04\x00\x0=
1\x06\x03\x00"=0A=
=A0 =A0 =A0 =A0 =A0"\x00\x00\x09\x21\x00\x00\xfd\x01\x22\x29\x00\x09\x05\x8=
1\x03\x00",=0A=
=A0 =A0 =A0 =A0 =A050);=0A=
=A0 res =3D -1;=0A=
=A0 res =3D syz_usb_connect(/*speed=3D*/0,=A0/*dev_len=3D*/0x36,=A0/*dev=3D=
*/0x20000040,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*conn_descs=3D*/0);=0A=
=A0 if (res !=3D -1)=0A=
=A0 =A0 r[0] =3D=A0res;=0A=
=A0 syz_usb_control_io(/*fd=3D*/r[0],=A0/*descs=3D*/0,=A0/*resps=3D*/0);=0A=
=A0 *(uint32_t*)0x20000600 =3D 0x2c;=0A=
=A0 *(uint64_t*)0x20000604 =3D 0x20000240;=0A=
=A0 *(uint64_t*)0x2000060c =3D 0;=0A=
=A0 *(uint64_t*)0x20000614 =3D 0;=0A=
=A0 *(uint64_t*)0x2000061c =3D 0;=0A=
=A0 *(uint64_t*)0x20000624 =3D 0;=0A=
=A0 syz_usb_control_io(/*fd=3D*/r[0],=A0/*descs=3D*/0x20000600,=A0/*resps=
=3D*/0);=0A=
}=0A=
int main(void)=0A=
{=0A=
=A0 syscall(__NR_mmap,=A0/*addr=3D*/0x1ffff000ul,=A0/*len=3D*/0x1000ul,=A0/=
*prot=3D*/0ul,=0A=
=A0 =A0 =A0 =A0 =A0 /*flags=3DMAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,=
=A0/*fd=3D*/-1,=0A=
=A0 =A0 =A0 =A0 =A0 /*offset=3D*/0ul);=0A=
=A0 syscall(__NR_mmap,=A0/*addr=3D*/0x20000000ul,=A0/*len=3D*/0x1000000ul,=
=0A=
=A0 =A0 =A0 =A0 =A0 /*prot=3DPROT_WRITE|PROT_READ|PROT_EXEC*/ 7ul,=0A=
=A0 =A0 =A0 =A0 =A0 /*flags=3DMAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,=
=A0/*fd=3D*/-1,=0A=
=A0 =A0 =A0 =A0 =A0 /*offset=3D*/0ul);=0A=
=A0 syscall(__NR_mmap,=A0/*addr=3D*/0x21000000ul,=A0/*len=3D*/0x1000ul,=A0/=
*prot=3D*/0ul,=0A=
=A0 =A0 =A0 =A0 =A0 /*flags=3DMAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,=
=A0/*fd=3D*/-1,=0A=
=A0 =A0 =A0 =A0 =A0 /*offset=3D*/0ul);=0A=
=A0 const char*=A0reason;=0A=
=A0 (void)reason;=0A=
=A0 for (procid =3D 0;=A0procid < 4;=A0procid++) {=0A=
=A0 =A0 if (fork() =3D=3D 0) {=0A=
=A0 =A0 =A0 use_temporary_dir();=0A=
=A0 =A0 =A0 loop();=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 sleep(1000000);=0A=
=A0 return 0;=0A=
}=0A=
// autogenerated by syzkaller (https://github.com/google/syzkaller)=0A=
=0A=
#define _GNU_SOURCE=0A=
=0A=
#include <dirent.h>=0A=
#include <endian.h>=0A=
#include <errno.h>=0A=
#include <fcntl.h>=0A=
#include <signal.h>=0A=
#include <stdarg.h>=0A=
#include <stdbool.h>=0A=
#include <stddef.h>=0A=
#include <stdint.h>=0A=
#include <stdio.h>=0A=
#include <stdlib.h>=0A=
#include <string.h>=0A=
#include <sys/ioctl.h>=0A=
#include <sys/mount.h>=0A=
#include <sys/prctl.h>=0A=
#include <sys/stat.h>=0A=
#include <sys/syscall.h>=0A=
#include <sys/types.h>=0A=
#include <sys/wait.h>=0A=
#include <time.h>=0A=
#include <unistd.h>=0A=
=0A=
#include <linux/usb/ch9.h>=0A=
=0A=
static unsigned long long=A0procid;=0A=
=0A=
static void sleep_ms(uint64_t ms)=0A=
{=0A=
=A0 usleep(ms * 1000);=0A=
}=0A=
=0A=
static uint64_t current_time_ms(void)=0A=
{=0A=
=A0 struct=A0timespec ts;=0A=
=A0 if (clock_gettime(CLOCK_MONOTONIC, &ts))=0A=
=A0 =A0 exit(1);=0A=
=A0 return (uint64_t)ts.tv_sec * 1000 + (uint64_t)ts.tv_nsec / 1000000;=0A=
}=0A=
=0A=
static void use_temporary_dir(void)=0A=
{=0A=
=A0 char=A0tmpdir_template[] =3D "./syzkaller.XXXXXX";=0A=
=A0 char*=A0tmpdir =3D mkdtemp(tmpdir_template);=0A=
=A0 if (!tmpdir)=0A=
=A0 =A0 exit(1);=0A=
=A0 if (chmod(tmpdir, 0777))=0A=
=A0 =A0 exit(1);=0A=
=A0 if (chdir(tmpdir))=0A=
=A0 =A0 exit(1);=0A=
}=0A=
=0A=
static bool write_file(const char* file, const char* what, ...)=0A=
{=0A=
=A0 char buf[1024];=0A=
=A0 va_list args;=0A=
=A0 va_start(args,=A0what);=0A=
=A0 vsnprintf(buf, sizeof(buf),=A0what,=A0args);=0A=
=A0 va_end(args);=0A=
=A0 buf[sizeof(buf) - 1] =3D 0;=0A=
=A0 int=A0len =3D strlen(buf);=0A=
=A0 int=A0fd =3D open(file,=A0O_WRONLY |=A0O_CLOEXEC);=0A=
=A0 if (fd =3D=3D -1)=0A=
=A0 =A0 return false;=0A=
=A0 if (write(fd,=A0buf,=A0len) !=3D=A0len) {=0A=
=A0 =A0 int=A0err =3D=A0errno;=0A=
=A0 =A0 close(fd);=0A=
=A0 =A0 errno =3D=A0err;=0A=
=A0 =A0 return false;=0A=
=A0 }=0A=
=A0 close(fd);=0A=
=A0 return true;=0A=
}=0A=
=0A=
#define MAX_FDS 30=0A=
=0A=
#define USB_MAX_IFACE_NUM 4=0A=
#define USB_MAX_EP_NUM 32=0A=
#define USB_MAX_FDS 6=0A=
=0A=
struct=A0usb_endpoint_index {=0A=
=A0 struct=A0usb_endpoint_descriptor desc;=0A=
=A0 int=A0handle;=0A=
};=0A=
=0A=
struct=A0usb_iface_index {=0A=
=A0 struct=A0usb_interface_descriptor*=A0iface;=0A=
=A0 uint8_t=A0bInterfaceNumber;=0A=
=A0 uint8_t=A0bAlternateSetting;=0A=
=A0 uint8_t=A0bInterfaceClass;=0A=
=A0 struct=A0usb_endpoint_index eps[USB_MAX_EP_NUM];=0A=
=A0 int=A0eps_num;=0A=
};=0A=
=0A=
struct=A0usb_device_index {=0A=
=A0 struct=A0usb_device_descriptor*=A0dev;=0A=
=A0 struct=A0usb_config_descriptor*=A0config;=0A=
=A0 uint8_t=A0bDeviceClass;=0A=
=A0 uint8_t=A0bMaxPower;=0A=
=A0 int=A0config_length;=0A=
=A0 struct=A0usb_iface_index ifaces[USB_MAX_IFACE_NUM];=0A=
=A0 int=A0ifaces_num;=0A=
=A0 int=A0iface_cur;=0A=
};=0A=
=0A=
struct=A0usb_info {=0A=
=A0 int=A0fd;=0A=
=A0 struct=A0usb_device_index index;=0A=
};=0A=
=0A=
static struct=A0usb_info usb_devices[USB_MAX_FDS];=0A=
=0A=
static struct=A0usb_device_index* lookup_usb_index(int fd)=0A=
{=0A=
=A0 for (int=A0i =3D 0;=A0i <=A0USB_MAX_FDS;=A0i++) {=0A=
=A0 =A0 if (__atomic_load_n(&usb_devices[i].fd,=A0__ATOMIC_ACQUIRE) =3D=3D=
=A0fd)=0A=
=A0 =A0 =A0 return &usb_devices[i].index;=0A=
=A0 }=0A=
=A0 return NULL;=0A=
}=0A=
=0A=
static int=A0usb_devices_num;=0A=
=0A=
static bool parse_usb_descriptor(const char* buffer, size_t length,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct=
=A0usb_device_index* index)=0A=
{=0A=
=A0 if (length < sizeof(*index->dev) + sizeof(*index->config))=0A=
=A0 =A0 return false;=0A=
=A0 memset(index, 0, sizeof(*index));=0A=
=A0 index->dev =3D (struct=A0usb_device_descriptor*)buffer;=0A=
=A0 index->config =3D (struct=A0usb_config_descriptor*)(buffer + sizeof(*in=
dex->dev));=0A=
=A0 index->bDeviceClass =3D index->dev->bDeviceClass;=0A=
=A0 index->bMaxPower =3D index->config->bMaxPower;=0A=
=A0 index->config_length =3D=A0length - sizeof(*index->dev);=0A=
=A0 index->iface_cur =3D -1;=0A=
=A0 size_t=A0offset =3D 0;=0A=
=A0 while (true) {=0A=
=A0 =A0 if (offset + 1 >=3D=A0length)=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 uint8_t=A0desc_length =3D buffer[offset];=0A=
=A0 =A0 uint8_t=A0desc_type =3D buffer[offset + 1];=0A=
=A0 =A0 if (desc_length <=3D 2)=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 if (offset +=A0desc_length >=A0length)=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 if (desc_type =3D=3D=A0USB_DT_INTERFACE &&=0A=
=A0 =A0 =A0 =A0 index->ifaces_num <=A0USB_MAX_IFACE_NUM) {=0A=
=A0 =A0 =A0 struct=A0usb_interface_descriptor*=A0iface =3D=0A=
=A0 =A0 =A0 =A0 =A0 (struct=A0usb_interface_descriptor*)(buffer +=A0offset)=
;=0A=
=A0 =A0 =A0 index->ifaces[index->ifaces_num].iface =3D=A0iface;=0A=
=A0 =A0 =A0 index->ifaces[index->ifaces_num].bInterfaceNumber =3D=0A=
=A0 =A0 =A0 =A0 =A0 iface->bInterfaceNumber;=0A=
=A0 =A0 =A0 index->ifaces[index->ifaces_num].bAlternateSetting =3D=0A=
=A0 =A0 =A0 =A0 =A0 iface->bAlternateSetting;=0A=
=A0 =A0 =A0 index->ifaces[index->ifaces_num].bInterfaceClass =3D iface->bIn=
terfaceClass;=0A=
=A0 =A0 =A0 index->ifaces_num++;=0A=
=A0 =A0 }=0A=
=A0 =A0 if (desc_type =3D=3D=A0USB_DT_ENDPOINT && index->ifaces_num > 0) {=
=0A=
=A0 =A0 =A0 struct=A0usb_iface_index*=A0iface =3D &index->ifaces[index->ifa=
ces_num - 1];=0A=
=A0 =A0 =A0 if (iface->eps_num <=A0USB_MAX_EP_NUM) {=0A=
=A0 =A0 =A0 =A0 memcpy(&iface->eps[iface->eps_num].desc,=A0buffer +=A0offse=
t,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sizeof(iface->eps[iface->eps_num].desc));=0A=
=A0 =A0 =A0 =A0 iface->eps_num++;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 offset +=3D=A0desc_length;=0A=
=A0 }=0A=
=A0 return true;=0A=
}=0A=
=0A=
static struct=A0usb_device_index* add_usb_index(int fd, const char* dev,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 size_t dev_len)=0A=
{=0A=
=A0 int=A0i =3D __atomic_fetch_add(&usb_devices_num, 1,=A0__ATOMIC_RELAXED)=
;=0A=
=A0 if (i >=3D=A0USB_MAX_FDS)=0A=
=A0 =A0 return NULL;=0A=
=A0 if (!parse_usb_descriptor(dev,=A0dev_len, &usb_devices[i].index))=0A=
=A0 =A0 return NULL;=0A=
=A0 __atomic_store_n(&usb_devices[i].fd,=A0fd,=A0__ATOMIC_RELEASE);=0A=
=A0 return &usb_devices[i].index;=0A=
}=0A=
=0A=
struct=A0vusb_connect_string_descriptor {=0A=
=A0 uint32_t=A0len;=0A=
=A0 char*=A0str;=0A=
} __attribute__((packed));=0A=
=0A=
struct=A0vusb_connect_descriptors {=0A=
=A0 uint32_t=A0qual_len;=0A=
=A0 char*=A0qual;=0A=
=A0 uint32_t=A0bos_len;=0A=
=A0 char*=A0bos;=0A=
=A0 uint32_t=A0strs_len;=0A=
=A0 struct=A0vusb_connect_string_descriptor strs[0];=0A=
} __attribute__((packed));=0A=
=0A=
static const char=A0default_string[] =3D {8,=A0USB_DT_STRING, 's', 0, 'y', =
0, 'z', 0};=0A=
=0A=
static const char=A0default_lang_id[] =3D {4,=A0USB_DT_STRING, 0x09, 0x04};=
=0A=
=0A=
static bool=0A=
lookup_connect_response_in(int fd, const struct=A0vusb_connect_descriptors*=
 descs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct=A0usb_c=
trlrequest* ctrl,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct=A0usb_qualifi=
er_descriptor* qual,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0char** response_data=
, uint32_t* response_length)=0A=
{=0A=
=A0 struct=A0usb_device_index*=A0index =3D lookup_usb_index(fd);=0A=
=A0 uint8_t=A0str_idx;=0A=
=A0 if (!index)=0A=
=A0 =A0 return false;=0A=
=A0 switch (ctrl->bRequestType &=A0USB_TYPE_MASK) {=0A=
=A0 case=A0USB_TYPE_STANDARD:=0A=
=A0 =A0 switch (ctrl->bRequest) {=0A=
=A0 =A0 case=A0USB_REQ_GET_DESCRIPTOR:=0A=
=A0 =A0 =A0 switch (ctrl->wValue >> 8) {=0A=
=A0 =A0 =A0 case=A0USB_DT_DEVICE:=0A=
=A0 =A0 =A0 =A0 *response_data =3D (char*)index->dev;=0A=
=A0 =A0 =A0 =A0 *response_length =3D sizeof(*index->dev);=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 case=A0USB_DT_CONFIG:=0A=
=A0 =A0 =A0 =A0 *response_data =3D (char*)index->config;=0A=
=A0 =A0 =A0 =A0 *response_length =3D index->config_length;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 case=A0USB_DT_STRING:=0A=
=A0 =A0 =A0 =A0 str_idx =3D (uint8_t)ctrl->wValue;=0A=
=A0 =A0 =A0 =A0 if (descs &&=A0str_idx <=A0descs->strs_len) {=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D descs->strs[str_idx].str;=0A=
=A0 =A0 =A0 =A0 =A0 *response_length =3D descs->strs[str_idx].len;=0A=
=A0 =A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 if (str_idx =3D=3D 0) {=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D (char*)&default_lang_id[0];=0A=
=A0 =A0 =A0 =A0 =A0 *response_length =3D default_lang_id[0];=0A=
=A0 =A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 *response_data =3D (char*)&default_string[0];=0A=
=A0 =A0 =A0 =A0 *response_length =3D default_string[0];=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 case=A0USB_DT_BOS:=0A=
=A0 =A0 =A0 =A0 *response_data =3D descs->bos;=0A=
=A0 =A0 =A0 =A0 *response_length =3D descs->bos_len;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 case=A0USB_DT_DEVICE_QUALIFIER:=0A=
=A0 =A0 =A0 =A0 if (!descs->qual) {=0A=
=A0 =A0 =A0 =A0 =A0 qual->bLength =3D sizeof(*qual);=0A=
=A0 =A0 =A0 =A0 =A0 qual->bDescriptorType =3D=A0USB_DT_DEVICE_QUALIFIER;=0A=
=A0 =A0 =A0 =A0 =A0 qual->bcdUSB =3D index->dev->bcdUSB;=0A=
=A0 =A0 =A0 =A0 =A0 qual->bDeviceClass =3D index->dev->bDeviceClass;=0A=
=A0 =A0 =A0 =A0 =A0 qual->bDeviceSubClass =3D index->dev->bDeviceSubClass;=
=0A=
=A0 =A0 =A0 =A0 =A0 qual->bDeviceProtocol =3D index->dev->bDeviceProtocol;=
=0A=
=A0 =A0 =A0 =A0 =A0 qual->bMaxPacketSize0 =3D index->dev->bMaxPacketSize0;=
=0A=
=A0 =A0 =A0 =A0 =A0 qual->bNumConfigurations =3D index->dev->bNumConfigurat=
ions;=0A=
=A0 =A0 =A0 =A0 =A0 qual->bRESERVED =3D 0;=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D (char*)qual;=0A=
=A0 =A0 =A0 =A0 =A0 *response_length =3D sizeof(*qual);=0A=
=A0 =A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 *response_data =3D descs->qual;=0A=
=A0 =A0 =A0 =A0 *response_length =3D descs->qual_len;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 default:=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 default:=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 }=0A=
=A0 =A0 break;=0A=
=A0 default:=0A=
=A0 =A0 break;=0A=
=A0 }=0A=
=A0 return false;=0A=
}=0A=
=0A=
typedef bool (*lookup_connect_out_response_t)(=0A=
=A0 =A0 int=A0fd, const struct=A0vusb_connect_descriptors*=A0descs,=0A=
=A0 =A0 const struct=A0usb_ctrlrequest*=A0ctrl, bool*=A0done);=0A=
=0A=
static bool lookup_connect_response_out_generic(=0A=
=A0 =A0 int fd, const struct=A0vusb_connect_descriptors* descs,=0A=
=A0 =A0 const struct=A0usb_ctrlrequest* ctrl, bool* done)=0A=
{=0A=
=A0 switch (ctrl->bRequestType &=A0USB_TYPE_MASK) {=0A=
=A0 case=A0USB_TYPE_STANDARD:=0A=
=A0 =A0 switch (ctrl->bRequest) {=0A=
=A0 =A0 case=A0USB_REQ_SET_CONFIGURATION:=0A=
=A0 =A0 =A0 *done =3D true;=0A=
=A0 =A0 =A0 return true;=0A=
=A0 =A0 default:=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 }=0A=
=A0 =A0 break;=0A=
=A0 }=0A=
=A0 return false;=0A=
}=0A=
=0A=
struct=A0vusb_descriptor {=0A=
=A0 uint8_t=A0req_type;=0A=
=A0 uint8_t=A0desc_type;=0A=
=A0 uint32_t=A0len;=0A=
=A0 char data[0];=0A=
} __attribute__((packed));=0A=
=0A=
struct=A0vusb_descriptors {=0A=
=A0 uint32_t=A0len;=0A=
=A0 struct=A0vusb_descriptor*=A0generic;=0A=
=A0 struct=A0vusb_descriptor* descs[0];=0A=
} __attribute__((packed));=0A=
=0A=
struct=A0vusb_response {=0A=
=A0 uint8_t=A0type;=0A=
=A0 uint8_t=A0req;=0A=
=A0 uint32_t=A0len;=0A=
=A0 char data[0];=0A=
} __attribute__((packed));=0A=
=0A=
struct=A0vusb_responses {=0A=
=A0 uint32_t=A0len;=0A=
=A0 struct=A0vusb_response*=A0generic;=0A=
=A0 struct=A0vusb_response* resps[0];=0A=
} __attribute__((packed));=0A=
=0A=
static bool lookup_control_response(const struct=A0vusb_descriptors* descs,=
=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 con=
st struct=A0vusb_responses* resps,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 str=
uct=A0usb_ctrlrequest* ctrl,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cha=
r** response_data,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uin=
t32_t* response_length)=0A=
{=0A=
=A0 int=A0descs_num =3D 0;=0A=
=A0 int=A0resps_num =3D 0;=0A=
=A0 if (descs)=0A=
=A0 =A0 descs_num =3D (descs->len - offsetof(struct=A0vusb_descriptors,=A0d=
escs)) /=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(descs->descs[0]);=0A=
=A0 if (resps)=0A=
=A0 =A0 resps_num =3D (resps->len - offsetof(struct=A0vusb_responses,=A0res=
ps)) /=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sizeof(resps->resps[0]);=0A=
=A0 uint8_t=A0req =3D ctrl->bRequest;=0A=
=A0 uint8_t=A0req_type =3D ctrl->bRequestType &=A0USB_TYPE_MASK;=0A=
=A0 uint8_t=A0desc_type =3D ctrl->wValue >> 8;=0A=
=A0 if (req =3D=3D=A0USB_REQ_GET_DESCRIPTOR) {=0A=
=A0 =A0 int=A0i;=0A=
=A0 =A0 for (i =3D 0;=A0i <=A0descs_num;=A0i++) {=0A=
=A0 =A0 =A0 struct=A0vusb_descriptor*=A0desc =3D descs->descs[i];=0A=
=A0 =A0 =A0 if (!desc)=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 if (desc->req_type =3D=3D=A0req_type && desc->desc_type =3D=3D=
=A0desc_type) {=0A=
=A0 =A0 =A0 =A0 *response_length =3D desc->len;=0A=
=A0 =A0 =A0 =A0 if (*response_length !=3D 0)=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D &desc->data[0];=0A=
=A0 =A0 =A0 =A0 else=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D NULL;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 if (descs && descs->generic) {=0A=
=A0 =A0 =A0 *response_data =3D &descs->generic->data[0];=0A=
=A0 =A0 =A0 *response_length =3D descs->generic->len;=0A=
=A0 =A0 =A0 return true;=0A=
=A0 =A0 }=0A=
=A0 } else {=0A=
=A0 =A0 int=A0i;=0A=
=A0 =A0 for (i =3D 0;=A0i <=A0resps_num;=A0i++) {=0A=
=A0 =A0 =A0 struct=A0vusb_response*=A0resp =3D resps->resps[i];=0A=
=A0 =A0 =A0 if (!resp)=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 if (resp->type =3D=3D=A0req_type && resp->req =3D=3D=A0req) {=
=0A=
=A0 =A0 =A0 =A0 *response_length =3D resp->len;=0A=
=A0 =A0 =A0 =A0 if (*response_length !=3D 0)=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D &resp->data[0];=0A=
=A0 =A0 =A0 =A0 else=0A=
=A0 =A0 =A0 =A0 =A0 *response_data =3D NULL;=0A=
=A0 =A0 =A0 =A0 return true;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 if (resps && resps->generic) {=0A=
=A0 =A0 =A0 *response_data =3D &resps->generic->data[0];=0A=
=A0 =A0 =A0 *response_length =3D resps->generic->len;=0A=
=A0 =A0 =A0 return true;=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 return false;=0A=
}=0A=
=0A=
#define UDC_NAME_LENGTH_MAX 128=0A=
=0A=
struct=A0usb_raw_init {=0A=
=A0 __u8 driver_name[UDC_NAME_LENGTH_MAX];=0A=
=A0 __u8 device_name[UDC_NAME_LENGTH_MAX];=0A=
=A0 __u8 speed;=0A=
};=0A=
=0A=
enum=A0usb_raw_event_type {=0A=
=A0 USB_RAW_EVENT_INVALID =3D 0,=0A=
=A0 USB_RAW_EVENT_CONNECT =3D 1,=0A=
=A0 USB_RAW_EVENT_CONTROL =3D 2,=0A=
};=0A=
=0A=
struct=A0usb_raw_event {=0A=
=A0 __u32 type;=0A=
=A0 __u32 length;=0A=
=A0 __u8 data[0];=0A=
};=0A=
=0A=
struct=A0usb_raw_ep_io {=0A=
=A0 __u16 ep;=0A=
=A0 __u16 flags;=0A=
=A0 __u32 length;=0A=
=A0 __u8 data[0];=0A=
};=0A=
=0A=
#define USB_RAW_EPS_NUM_MAX 30=0A=
#define USB_RAW_EP_NAME_MAX 16=0A=
#define USB_RAW_EP_ADDR_ANY 0xff=0A=
=0A=
struct=A0usb_raw_ep_caps {=0A=
=A0 __u32 type_control : 1;=0A=
=A0 __u32 type_iso : 1;=0A=
=A0 __u32 type_bulk : 1;=0A=
=A0 __u32 type_int : 1;=0A=
=A0 __u32 dir_in : 1;=0A=
=A0 __u32 dir_out : 1;=0A=
};=0A=
=0A=
struct=A0usb_raw_ep_limits {=0A=
=A0 __u16 maxpacket_limit;=0A=
=A0 __u16 max_streams;=0A=
=A0 __u32 reserved;=0A=
};=0A=
=0A=
struct=A0usb_raw_ep_info {=0A=
=A0 __u8 name[USB_RAW_EP_NAME_MAX];=0A=
=A0 __u32 addr;=0A=
=A0 struct=A0usb_raw_ep_caps caps;=0A=
=A0 struct=A0usb_raw_ep_limits limits;=0A=
};=0A=
=0A=
struct=A0usb_raw_eps_info {=0A=
=A0 struct=A0usb_raw_ep_info eps[USB_RAW_EPS_NUM_MAX];=0A=
};=0A=
=0A=
#define USB_RAW_IOCTL_INIT _IOW('U', 0, struct=A0usb_raw_init)=0A=
#define USB_RAW_IOCTL_RUN _IO('U', 1)=0A=
#define USB_RAW_IOCTL_EVENT_FETCH _IOR('U', 2, struct=A0usb_raw_event)=0A=
#define USB_RAW_IOCTL_EP0_WRITE _IOW('U', 3, struct=A0usb_raw_ep_io)=0A=
#define USB_RAW_IOCTL_EP0_READ _IOWR('U', 4, struct=A0usb_raw_ep_io)=0A=
#define USB_RAW_IOCTL_EP_ENABLE _IOW('U', 5, struct=A0usb_endpoint_descript=
or)=0A=
#define USB_RAW_IOCTL_EP_DISABLE _IOW('U', 6,=A0__u32)=0A=
#define USB_RAW_IOCTL_EP_WRITE _IOW('U', 7, struct=A0usb_raw_ep_io)=0A=
#define USB_RAW_IOCTL_EP_READ _IOWR('U', 8, struct=A0usb_raw_ep_io)=0A=
#define USB_RAW_IOCTL_CONFIGURE _IO('U', 9)=0A=
#define USB_RAW_IOCTL_VBUS_DRAW _IOW('U', 10,=A0__u32)=0A=
#define USB_RAW_IOCTL_EPS_INFO _IOR('U', 11, struct=A0usb_raw_eps_info)=0A=
#define USB_RAW_IOCTL_EP0_STALL _IO('U', 12)=0A=
#define USB_RAW_IOCTL_EP_SET_HALT _IOW('U', 13,=A0__u32)=0A=
#define USB_RAW_IOCTL_EP_CLEAR_HALT _IOW('U', 14,=A0__u32)=0A=
#define USB_RAW_IOCTL_EP_SET_WEDGE _IOW('U', 15,=A0__u32)=0A=
=0A=
static int usb_raw_open()=0A=
{=0A=
=A0 return open("/dev/raw-gadget",=A0O_RDWR);=0A=
}=0A=
=0A=
static int usb_raw_init(int fd, uint32_t speed, const char* driver,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char* device)=0A=
{=0A=
=A0 struct=A0usb_raw_init arg;=0A=
=A0 strncpy((char*)&arg.driver_name[0],=A0driver, sizeof(arg.driver_name));=
=0A=
=A0 strncpy((char*)&arg.device_name[0],=A0device, sizeof(arg.device_name));=
=0A=
=A0 arg.speed =3D=A0speed;=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_INIT, &arg);=0A=
}=0A=
=0A=
static int usb_raw_run(int fd)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_RUN, 0);=0A=
}=0A=
=0A=
static int usb_raw_configure(int fd)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_CONFIGURE, 0);=0A=
}=0A=
=0A=
static int usb_raw_vbus_draw(int fd, uint32_t power)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_VBUS_DRAW,=A0power);=0A=
}=0A=
=0A=
static int usb_raw_ep0_write(int fd, struct=A0usb_raw_ep_io* io)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP0_WRITE,=A0io);=0A=
}=0A=
=0A=
static int usb_raw_ep0_read(int fd, struct=A0usb_raw_ep_io* io)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP0_READ,=A0io);=0A=
}=0A=
=0A=
static int usb_raw_event_fetch(int fd, struct=A0usb_raw_event* event)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EVENT_FETCH,=A0event);=0A=
}=0A=
=0A=
static int usb_raw_ep_enable(int fd, struct=A0usb_endpoint_descriptor* desc=
)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP_ENABLE,=A0desc);=0A=
}=0A=
=0A=
static int usb_raw_ep_disable(int fd, int ep)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP_DISABLE,=A0ep);=0A=
}=0A=
=0A=
static int usb_raw_ep0_stall(int fd)=0A=
{=0A=
=A0 return ioctl(fd,=A0USB_RAW_IOCTL_EP0_STALL, 0);=0A=
}=0A=
=0A=
static int lookup_interface(int fd, uint8_t bInterfaceNumber,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t bAlternateS=
etting)=0A=
{=0A=
=A0 struct=A0usb_device_index*=A0index =3D lookup_usb_index(fd);=0A=
=A0 if (!index)=0A=
=A0 =A0 return -1;=0A=
=A0 for (int=A0i =3D 0;=A0i < index->ifaces_num;=A0i++) {=0A=
=A0 =A0 if (index->ifaces[i].bInterfaceNumber =3D=3D=A0bInterfaceNumber &&=
=0A=
=A0 =A0 =A0 =A0 index->ifaces[i].bAlternateSetting =3D=3D=A0bAlternateSetti=
ng)=0A=
=A0 =A0 =A0 return=A0i;=0A=
=A0 }=0A=
=A0 return -1;=0A=
}=0A=
=0A=
#define USB_MAX_PACKET_SIZE 4096=0A=
=0A=
struct=A0usb_raw_control_event {=0A=
=A0 struct=A0usb_raw_event inner;=0A=
=A0 struct=A0usb_ctrlrequest ctrl;=0A=
=A0 char data[USB_MAX_PACKET_SIZE];=0A=
};=0A=
=0A=
struct=A0usb_raw_ep_io_data {=0A=
=A0 struct=A0usb_raw_ep_io inner;=0A=
=A0 char data[USB_MAX_PACKET_SIZE];=0A=
};=0A=
=0A=
static void set_interface(int fd, int n)=0A=
{=0A=
=A0 struct=A0usb_device_index*=A0index =3D lookup_usb_index(fd);=0A=
=A0 if (!index)=0A=
=A0 =A0 return;=0A=
=A0 if (index->iface_cur >=3D 0 && index->iface_cur < index->ifaces_num) {=
=0A=
=A0 =A0 for (int=A0ep =3D 0;=A0ep < index->ifaces[index->iface_cur].eps_num=
;=A0ep++) {=0A=
=A0 =A0 =A0 int=A0rv =3D usb_raw_ep_disable(=0A=
=A0 =A0 =A0 =A0 =A0 fd, index->ifaces[index->iface_cur].eps[ep].handle);=0A=
=A0 =A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 } else {=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 if (n >=3D 0 &&=A0n < index->ifaces_num) {=0A=
=A0 =A0 for (int=A0ep =3D 0;=A0ep < index->ifaces[n].eps_num;=A0ep++) {=0A=
=A0 =A0 =A0 int=A0rv =3D usb_raw_ep_enable(fd, &index->ifaces[n].eps[ep].de=
sc);=0A=
=A0 =A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 } else {=0A=
=A0 =A0 =A0 =A0 index->ifaces[n].eps[ep].handle =3D=A0rv;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 index->iface_cur =3D=A0n;=0A=
=A0 }=0A=
}=0A=
=0A=
static int configure_device(int fd)=0A=
{=0A=
=A0 struct=A0usb_device_index*=A0index =3D lookup_usb_index(fd);=0A=
=A0 if (!index)=0A=
=A0 =A0 return -1;=0A=
=A0 int=A0rv =3D usb_raw_vbus_draw(fd, index->bMaxPower);=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 rv =3D usb_raw_configure(fd);=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 set_interface(fd, 0);=0A=
=A0 return 0;=0A=
}=0A=
=0A=
static volatile long=0A=
syz_usb_connect_impl(uint64_t speed, uint64_t dev_len, const char* dev,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0const struct=A0vusb_connect_desc=
riptors* descs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0lookup_connect_out_response_t lo=
okup_connect_response_out)=0A=
{=0A=
=A0 if (!dev) {=0A=
=A0 =A0 return -1;=0A=
=A0 }=0A=
=A0 int=A0fd =3D usb_raw_open();=0A=
=A0 if (fd < 0) {=0A=
=A0 =A0 return=A0fd;=0A=
=A0 }=0A=
=A0 if (fd >=3D=A0MAX_FDS) {=0A=
=A0 =A0 close(fd);=0A=
=A0 =A0 return -1;=0A=
=A0 }=0A=
=A0 struct=A0usb_device_index*=A0index =3D add_usb_index(fd,=A0dev,=A0dev_l=
en);=0A=
=A0 if (!index) {=0A=
=A0 =A0 return -1;=0A=
=A0 }=0A=
=A0 char device[32];=0A=
=A0 sprintf(&device[0], "dummy_udc.%llu",=A0procid);=0A=
=A0 int=A0rv =3D usb_raw_init(fd,=A0speed, "dummy_udc", &device[0]);=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 rv =3D usb_raw_run(fd);=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 bool=A0done =3D false;=0A=
=A0 while (!done) {=0A=
=A0 =A0 struct=A0usb_raw_control_event event;=0A=
=A0 =A0 event.inner.type =3D 0;=0A=
=A0 =A0 event.inner.length =3D sizeof(event.ctrl);=0A=
=A0 =A0 rv =3D usb_raw_event_fetch(fd, (struct=A0usb_raw_event*)&event);=0A=
=A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 return=A0rv;=0A=
=A0 =A0 }=0A=
=A0 =A0 if (event.inner.type !=3D=A0USB_RAW_EVENT_CONTROL)=0A=
=A0 =A0 =A0 continue;=0A=
=A0 =A0 char*=A0response_data =3D NULL;=0A=
=A0 =A0 uint32_t=A0response_length =3D 0;=0A=
=A0 =A0 struct=A0usb_qualifier_descriptor qual;=0A=
=A0 =A0 if (event.ctrl.bRequestType &=A0USB_DIR_IN) {=0A=
=A0 =A0 =A0 if (!lookup_connect_response_in(fd,=A0descs, &event.ctrl, &qual=
,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 &response_data, &response_length)) {=0A=
=A0 =A0 =A0 =A0 usb_raw_ep0_stall(fd);=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 } else {=0A=
=A0 =A0 =A0 if (!lookup_connect_response_out(fd,=A0descs, &event.ctrl, &don=
e)) {=0A=
=A0 =A0 =A0 =A0 usb_raw_ep0_stall(fd);=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 response_data =3D NULL;=0A=
=A0 =A0 =A0 response_length =3D event.ctrl.wLength;=0A=
=A0 =A0 }=0A=
=A0 =A0 if ((event.ctrl.bRequestType &=A0USB_TYPE_MASK) =3D=3D=A0USB_TYPE_S=
TANDARD &&=0A=
=A0 =A0 =A0 =A0 event.ctrl.bRequest =3D=3D=A0USB_REQ_SET_CONFIGURATION) {=
=0A=
=A0 =A0 =A0 rv =3D configure_device(fd);=0A=
=A0 =A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 =A0 return=A0rv;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 struct=A0usb_raw_ep_io_data response;=0A=
=A0 =A0 response.inner.ep =3D 0;=0A=
=A0 =A0 response.inner.flags =3D 0;=0A=
=A0 =A0 if (response_length > sizeof(response.data))=0A=
=A0 =A0 =A0 response_length =3D 0;=0A=
=A0 =A0 if (event.ctrl.wLength <=A0response_length)=0A=
=A0 =A0 =A0 response_length =3D event.ctrl.wLength;=0A=
=A0 =A0 response.inner.length =3D=A0response_length;=0A=
=A0 =A0 if (response_data)=0A=
=A0 =A0 =A0 memcpy(&response.data[0],=A0response_data,=A0response_length);=
=0A=
=A0 =A0 else=0A=
=A0 =A0 =A0 memset(&response.data[0], 0,=A0response_length);=0A=
=A0 =A0 if (event.ctrl.bRequestType &=A0USB_DIR_IN) {=0A=
=A0 =A0 =A0 rv =3D usb_raw_ep0_write(fd, (struct=A0usb_raw_ep_io*)&response=
);=0A=
=A0 =A0 } else {=0A=
=A0 =A0 =A0 rv =3D usb_raw_ep0_read(fd, (struct=A0usb_raw_ep_io*)&response)=
;=0A=
=A0 =A0 }=0A=
=A0 =A0 if (rv < 0) {=0A=
=A0 =A0 =A0 return=A0rv;=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 sleep_ms(200);=0A=
=A0 return=A0fd;=0A=
}=0A=
=0A=
static volatile long syz_usb_connect(volatile long a0, volatile long a1,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
volatile long a2, volatile long a3)=0A=
{=0A=
=A0 uint64_t=A0speed =3D=A0a0;=0A=
=A0 uint64_t=A0dev_len =3D=A0a1;=0A=
=A0 const char*=A0dev =3D (const char*)a2;=0A=
=A0 const struct=A0vusb_connect_descriptors*=A0descs =3D=0A=
=A0 =A0 =A0 (const struct=A0vusb_connect_descriptors*)a3;=0A=
=A0 return syz_usb_connect_impl(speed,=A0dev_len,=A0dev,=A0descs,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &lookup_connect=
_response_out_generic);=0A=
}=0A=
=0A=
static volatile long syz_usb_control_io(volatile long a0, volatile long a1,=
=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 volatile long a2)=0A=
{=0A=
=A0 int=A0fd =3D=A0a0;=0A=
=A0 const struct=A0vusb_descriptors*=A0descs =3D (const struct=A0vusb_descr=
iptors*)a1;=0A=
=A0 const struct=A0vusb_responses*=A0resps =3D (const struct=A0vusb_respons=
es*)a2;=0A=
=A0 struct=A0usb_raw_control_event event;=0A=
=A0 event.inner.type =3D 0;=0A=
=A0 event.inner.length =3D=A0USB_MAX_PACKET_SIZE;=0A=
=A0 int=A0rv =3D usb_raw_event_fetch(fd, (struct=A0usb_raw_event*)&event);=
=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 if (event.inner.type !=3D=A0USB_RAW_EVENT_CONTROL) {=0A=
=A0 =A0 return -1;=0A=
=A0 }=0A=
=A0 char*=A0response_data =3D NULL;=0A=
=A0 uint32_t=A0response_length =3D 0;=0A=
=A0 if ((event.ctrl.bRequestType &=A0USB_DIR_IN) && event.ctrl.wLength) {=
=0A=
=A0 =A0 if (!lookup_control_response(descs,=A0resps, &event.ctrl, &response=
_data,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&respons=
e_length)) {=0A=
=A0 =A0 =A0 usb_raw_ep0_stall(fd);=0A=
=A0 =A0 =A0 return -1;=0A=
=A0 =A0 }=0A=
=A0 } else {=0A=
=A0 =A0 if ((event.ctrl.bRequestType &=A0USB_TYPE_MASK) =3D=3D=A0USB_TYPE_S=
TANDARD ||=0A=
=A0 =A0 =A0 =A0 event.ctrl.bRequest =3D=3D=A0USB_REQ_SET_INTERFACE) {=0A=
=A0 =A0 =A0 int=A0iface_num =3D event.ctrl.wIndex;=0A=
=A0 =A0 =A0 int=A0alt_set =3D event.ctrl.wValue;=0A=
=A0 =A0 =A0 int=A0iface_index =3D lookup_interface(fd,=A0iface_num,=A0alt_s=
et);=0A=
=A0 =A0 =A0 if (iface_index < 0) {=0A=
=A0 =A0 =A0 } else {=0A=
=A0 =A0 =A0 =A0 set_interface(fd,=A0iface_index);=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 response_length =3D event.ctrl.wLength;=0A=
=A0 }=0A=
=A0 struct=A0usb_raw_ep_io_data response;=0A=
=A0 response.inner.ep =3D 0;=0A=
=A0 response.inner.flags =3D 0;=0A=
=A0 if (response_length > sizeof(response.data))=0A=
=A0 =A0 response_length =3D 0;=0A=
=A0 if (event.ctrl.wLength <=A0response_length)=0A=
=A0 =A0 response_length =3D event.ctrl.wLength;=0A=
=A0 if ((event.ctrl.bRequestType &=A0USB_DIR_IN) && !event.ctrl.wLength) {=
=0A=
=A0 =A0 response_length =3D=A0USB_MAX_PACKET_SIZE;=0A=
=A0 }=0A=
=A0 response.inner.length =3D=A0response_length;=0A=
=A0 if (response_data)=0A=
=A0 =A0 memcpy(&response.data[0],=A0response_data,=A0response_length);=0A=
=A0 else=0A=
=A0 =A0 memset(&response.data[0], 0,=A0response_length);=0A=
=A0 if ((event.ctrl.bRequestType &=A0USB_DIR_IN) && event.ctrl.wLength) {=
=0A=
=A0 =A0 rv =3D usb_raw_ep0_write(fd, (struct=A0usb_raw_ep_io*)&response);=
=0A=
=A0 } else {=0A=
=A0 =A0 rv =3D usb_raw_ep0_read(fd, (struct=A0usb_raw_ep_io*)&response);=0A=
=A0 }=0A=
=A0 if (rv < 0) {=0A=
=A0 =A0 return=A0rv;=0A=
=A0 }=0A=
=A0 sleep_ms(200);=0A=
=A0 return 0;=0A=
}=0A=
=0A=
#define FS_IOC_SETFLAGS _IOW('f', 2, long)=0A=
static void remove_dir(const char* dir)=0A=
{=0A=
=A0 int=A0iter =3D 0;=0A=
=A0 DIR*=A0dp =3D 0;=0A=
=A0 const int=A0umount_flags =3D=A0MNT_FORCE |=A0UMOUNT_NOFOLLOW;=0A=
=0A=
retry:=0A=
=A0 while (umount2(dir,=A0umount_flags) =3D=3D 0) {=0A=
=A0 }=0A=
=A0 dp =3D opendir(dir);=0A=
=A0 if (dp =3D=3D NULL) {=0A=
=A0 =A0 if (errno =3D=3D=A0EMFILE) {=0A=
=A0 =A0 =A0 exit(1);=0A=
=A0 =A0 }=0A=
=A0 =A0 exit(1);=0A=
=A0 }=0A=
=A0 struct=A0dirent*=A0ep =3D 0;=0A=
=A0 while ((ep =3D readdir(dp))) {=0A=
=A0 =A0 if (strcmp(ep->d_name, ".") =3D=3D 0 || strcmp(ep->d_name, "..") =
=3D=3D 0)=0A=
=A0 =A0 =A0 continue;=0A=
=A0 =A0 char filename[FILENAME_MAX];=0A=
=A0 =A0 snprintf(filename, sizeof(filename), "%s/%s",=A0dir, ep->d_name);=
=0A=
=A0 =A0 while (umount2(filename,=A0umount_flags) =3D=3D 0) {=0A=
=A0 =A0 }=0A=
=A0 =A0 struct=A0stat st;=0A=
=A0 =A0 if (lstat(filename, &st))=0A=
=A0 =A0 =A0 exit(1);=0A=
=A0 =A0 if (S_ISDIR(st.st_mode)) {=0A=
=A0 =A0 =A0 remove_dir(filename);=0A=
=A0 =A0 =A0 continue;=0A=
=A0 =A0 }=0A=
=A0 =A0 int=A0i;=0A=
=A0 =A0 for (i =3D 0;;=A0i++) {=0A=
=A0 =A0 =A0 if (unlink(filename) =3D=3D 0)=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EPERM) {=0A=
=A0 =A0 =A0 =A0 int=A0fd =3D open(filename,=A0O_RDONLY);=0A=
=A0 =A0 =A0 =A0 if (fd !=3D -1) {=0A=
=A0 =A0 =A0 =A0 =A0 long=A0flags =3D 0;=0A=
=A0 =A0 =A0 =A0 =A0 if (ioctl(fd,=A0FS_IOC_SETFLAGS, &flags) =3D=3D 0) {=0A=
=A0 =A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 =A0 close(fd);=0A=
=A0 =A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EROFS) {=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno !=3D=A0EBUSY ||=A0i > 100)=0A=
=A0 =A0 =A0 =A0 exit(1);=0A=
=A0 =A0 =A0 if (umount2(filename,=A0umount_flags))=0A=
=A0 =A0 =A0 =A0 exit(1);=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 closedir(dp);=0A=
=A0 for (int=A0i =3D 0;;=A0i++) {=0A=
=A0 =A0 if (rmdir(dir) =3D=3D 0)=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 if (i < 100) {=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EPERM) {=0A=
=A0 =A0 =A0 =A0 int=A0fd =3D open(dir,=A0O_RDONLY);=0A=
=A0 =A0 =A0 =A0 if (fd !=3D -1) {=0A=
=A0 =A0 =A0 =A0 =A0 long=A0flags =3D 0;=0A=
=A0 =A0 =A0 =A0 =A0 if (ioctl(fd,=A0FS_IOC_SETFLAGS, &flags) =3D=3D 0) {=0A=
=A0 =A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 =A0 =A0 close(fd);=0A=
=A0 =A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EROFS) {=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0EBUSY) {=0A=
=A0 =A0 =A0 =A0 if (umount2(dir,=A0umount_flags))=0A=
=A0 =A0 =A0 =A0 =A0 exit(1);=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (errno =3D=3D=A0ENOTEMPTY) {=0A=
=A0 =A0 =A0 =A0 if (iter < 100) {=0A=
=A0 =A0 =A0 =A0 =A0 iter++;=0A=
=A0 =A0 =A0 =A0 =A0 goto=A0retry;=0A=
=A0 =A0 =A0 =A0 }=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 }=0A=
=A0 =A0 exit(1);=0A=
=A0 }=0A=
}=0A=
=0A=
static void kill_and_wait(int pid, int* status)=0A=
{=0A=
=A0 kill(-pid,=A0SIGKILL);=0A=
=A0 kill(pid,=A0SIGKILL);=0A=
=A0 for (int=A0i =3D 0;=A0i < 100;=A0i++) {=0A=
=A0 =A0 if (waitpid(-1,=A0status,=A0WNOHANG |=A0__WALL) =3D=3D=A0pid)=0A=
=A0 =A0 =A0 return;=0A=
=A0 =A0 usleep(1000);=0A=
=A0 }=0A=
=A0 DIR*=A0dir =3D opendir("/sys/fs/fuse/connections");=0A=
=A0 if (dir) {=0A=
=A0 =A0 for (;;) {=0A=
=A0 =A0 =A0 struct=A0dirent*=A0ent =3D readdir(dir);=0A=
=A0 =A0 =A0 if (!ent)=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 if (strcmp(ent->d_name, ".") =3D=3D 0 || strcmp(ent->d_name, ".=
.") =3D=3D 0)=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 char abort[300];=0A=
=A0 =A0 =A0 snprintf(abort, sizeof(abort), "/sys/fs/fuse/connections/%s/abo=
rt",=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ent->d_name);=0A=
=A0 =A0 =A0 int=A0fd =3D open(abort,=A0O_WRONLY);=0A=
=A0 =A0 =A0 if (fd =3D=3D -1) {=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 if (write(fd,=A0abort, 1) < 0) {=0A=
=A0 =A0 =A0 }=0A=
=A0 =A0 =A0 close(fd);=0A=
=A0 =A0 }=0A=
=A0 =A0 closedir(dir);=0A=
=A0 } else {=0A=
=A0 }=0A=
=A0 while (waitpid(-1,=A0status,=A0__WALL) !=3D=A0pid) {=0A=
=A0 }=0A=
}=0A=
=0A=
static void setup_test()=0A=
{=0A=
=A0 prctl(PR_SET_PDEATHSIG,=A0SIGKILL, 0, 0, 0);=0A=
=A0 setpgrp();=0A=
=A0 write_file("/proc/self/oom_score_adj", "1000");=0A=
=A0 if (symlink("/dev/binderfs", "./binderfs")) {=0A=
=A0 }=0A=
}=0A=
=0A=
static void execute_one(void);=0A=
=0A=
#define WAIT_FLAGS=A0__WALL=0A=
=0A=
static void loop(void)=0A=
{=0A=
=A0 int=A0iter =3D 0;=0A=
=A0 for (;;=A0iter++) {=0A=
=A0 =A0 char cwdbuf[32];=0A=
=A0 =A0 sprintf(cwdbuf, "./%d",=A0iter);=0A=
=A0 =A0 if (mkdir(cwdbuf, 0777))=0A=
=A0 =A0 =A0 exit(1);=0A=
=A0 =A0 int=A0pid =3D fork();=0A=
=A0 =A0 if (pid < 0)=0A=
=A0 =A0 =A0 exit(1);=0A=
=A0 =A0 if (pid =3D=3D 0) {=0A=
=A0 =A0 =A0 if (chdir(cwdbuf))=0A=
=A0 =A0 =A0 =A0 exit(1);=0A=
=A0 =A0 =A0 setup_test();=0A=
=A0 =A0 =A0 execute_one();=0A=
=A0 =A0 =A0 exit(0);=0A=
=A0 =A0 }=0A=
=A0 =A0 int=A0status =3D 0;=0A=
=A0 =A0 uint64_t=A0start =3D current_time_ms();=0A=
=A0 =A0 for (;;) {=0A=
=A0 =A0 =A0 sleep_ms(10);=0A=
=A0 =A0 =A0 if (waitpid(-1, &status,=A0WNOHANG |=A0WAIT_FLAGS) =3D=3D=A0pid=
)=0A=
=A0 =A0 =A0 =A0 break;=0A=
=A0 =A0 =A0 if (current_time_ms() -=A0start < 5000)=0A=
=A0 =A0 =A0 =A0 continue;=0A=
=A0 =A0 =A0 kill_and_wait(pid, &status);=0A=
=A0 =A0 =A0 break;=0A=
=A0 =A0 }=0A=
=A0 =A0 remove_dir(cwdbuf);=0A=
=A0 }=0A=
}=0A=
=0A=
uint64_t r[1] =3D {0xffffffffffffffff};=0A=
=0A=
void execute_one(void)=0A=
{=0A=
=A0 intptr_t=A0res =3D 0;=0A=
=A0 if (write(1, "executing program\n", sizeof("executing program\n") - 1))=
 {=0A=
=A0 }=0A=
=A0 *(uint64_t*)0x20000200 =3D 0;=0A=
=A0 memcpy((void*)0x20000208,=0A=
=A0 =A0 =A0 =A0 =A0"\x99\x21\x50\x23\x42\x9a\xb7\x3e\xd3\x03\xe6\x20\x15\x1=
a\xe6\x0e\xe2"=0A=
=A0 =A0 =A0 =A0 =A0"\x13\x1c\x5d\x61\xb3\xd1\xb5\x3b\x48\x7f\x98\x47\xfc\x1=
e\x89\xd0\x08"=0A=
=A0 =A0 =A0 =A0 =A0"\xb9\xa4\xc8\xa0\x87\xf0\xc6\x30\x1a\x80\xd4\xbb\xd0\x4=
2\xdd\xd0\x29"=0A=
=A0 =A0 =A0 =A0 =A0"\xd9\x84\x3f\x26\xb1\x1b\x62\x57",=0A=
=A0 =A0 =A0 =A0 =A059);=0A=
=A0 syscall(__NR_msgsnd,=A0/*msqid=3D*/0,=A0/*msgp=3D*/0x20000200ul,=A0/*sz=
=3D*/0x43ul,=0A=
=A0 =A0 =A0 =A0 =A0 /*flags=3DIPC_NOWAIT*/ 0x800ul);=0A=
=A0 memcpy((void*)0x20000040,=0A=
=A0 =A0 =A0 =A0 =A0"\x12\x01\x00\x02\x00\x00\x00\x40\x1c\x1b\x2a\x1b\x00\x0=
0\x00\x00\x00"=0A=
=A0 =A0 =A0 =A0 =A0"\x01\x09\x02\x24\x00\x01\x00\x00\x00\x03\x09\x04\x00\x0=
1\x06\x03\x00"=0A=
=A0 =A0 =A0 =A0 =A0"\x00\x00\x09\x21\x00\x00\xfd\x01\x22\x29\x00\x09\x05\x8=
1\x03\x00",=0A=
=A0 =A0 =A0 =A0 =A050);=0A=
=A0 res =3D -1;=0A=
=A0 res =3D syz_usb_connect(/*speed=3D*/0,=A0/*dev_len=3D*/0x36,=A0/*dev=3D=
*/0x20000040,=0A=
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*conn_descs=3D*/0);=0A=
=A0 if (res !=3D -1)=0A=
=A0 =A0 r[0] =3D=A0res;=0A=
=A0 syz_usb_control_io(/*fd=3D*/r[0],=A0/*descs=3D*/0,=A0/*resps=3D*/0);=0A=
=A0 *(uint32_t*)0x20000600 =3D 0x2c;=0A=
=A0 *(uint64_t*)0x20000604 =3D 0x20000240;=0A=
=A0 *(uint64_t*)0x2000060c =3D 0;=0A=
=A0 *(uint64_t*)0x20000614 =3D 0;=0A=
=A0 *(uint64_t*)0x2000061c =3D 0;=0A=
=A0 *(uint64_t*)0x20000624 =3D 0;=0A=
=A0 syz_usb_control_io(/*fd=3D*/r[0],=A0/*descs=3D*/0x20000600,=A0/*resps=
=3D*/0);=0A=
}=0A=
int main(void)=0A=
{=0A=
=A0 syscall(__NR_mmap,=A0/*addr=3D*/0x1ffff000ul,=A0/*len=3D*/0x1000ul,=A0/=
*prot=3D*/0ul,=0A=
=A0 =A0 =A0 =A0 =A0 /*flags=3DMAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,=
=A0/*fd=3D*/-1,=0A=
=A0 =A0 =A0 =A0 =A0 /*offset=3D*/0ul);=0A=
=A0 syscall(__NR_mmap,=A0/*addr=3D*/0x20000000ul,=A0/*len=3D*/0x1000000ul,=
=0A=
=A0 =A0 =A0 =A0 =A0 /*prot=3DPROT_WRITE|PROT_READ|PROT_EXEC*/ 7ul,=0A=
=A0 =A0 =A0 =A0 =A0 /*flags=3DMAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,=
=A0/*fd=3D*/-1,=0A=
=A0 =A0 =A0 =A0 =A0 /*offset=3D*/0ul);=0A=
=A0 syscall(__NR_mmap,=A0/*addr=3D*/0x21000000ul,=A0/*len=3D*/0x1000ul,=A0/=
*prot=3D*/0ul,=0A=
=A0 =A0 =A0 =A0 =A0 /*flags=3DMAP_FIXED|MAP_ANONYMOUS|MAP_PRIVATE*/ 0x32ul,=
=A0/*fd=3D*/-1,=0A=
=A0 =A0 =A0 =A0 =A0 /*offset=3D*/0ul);=0A=
=A0 const char*=A0reason;=0A=
=A0 (void)reason;=0A=
=A0 for (procid =3D 0;=A0procid < 4;=A0procid++) {=0A=
=A0 =A0 if (fork() =3D=3D 0) {=0A=
=A0 =A0 =A0 use_temporary_dir();=0A=
=A0 =A0 =A0 loop();=0A=
=A0 =A0 }=0A=
=A0 }=0A=
=A0 sleep(1000000);=0A=
=A0 return 0;=0A=
}=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
syz log=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
msgsnd(0x0, &(0x7f0000000200)=3D{0x0, "99215023429ab73ed303e620151ae60ee213=
1c5d61b3d1b53b487f9847fc1e89d008b9a4c8a087f0c6301a80d4bbd042ddd029d9843f26b=
11b6257"}, 0x43, 0x800)=0A=
r0 =3D syz_usb_connect$hid(0x0, 0x36, &(0x7f0000000040)=3DANY=3D[@ANYBLOB=
=3D"12010002000000401c1b2a1b00000000000109022400010000000309040001060300000=
009210000fd012229000905810300"], 0x0)=0A=
syz_usb_control_io$hid(r0, 0x0, 0x0)=0A=
syz_usb_control_io(r0, &(0x7f0000000600)=3D{0x2c, &(0x7f0000000240)=3DANY=
=3D[], 0x0, 0x0, 0x0, 0x0}, 0x0)=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
kernel build config=0A=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0A=
=0A=

