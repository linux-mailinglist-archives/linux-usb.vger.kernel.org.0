Return-Path: <linux-usb+bounces-8560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF1A89066D
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 17:57:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D241F22EEB
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 16:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075FF55C3C;
	Thu, 28 Mar 2024 16:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="tbouiZBJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19011003.outbound.protection.outlook.com [52.103.43.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B338513AF9
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 16:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711645034; cv=fail; b=LVY24BF0xpcUEuN26hXuDi1JuukxuocMAqmMBp/nFSlFgtPw7oL8LZdPc9Y7o0cG67Yx6obBlRzK8lGhcKU5Hf5UaSt1AU2/JxW+FTo+RE4k8F4wnRNk9wnrQvPv4uyzcMQexzAIY8XxNp8BxV5UEVYkzUeUgm7qUEVj33iC3Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711645034; c=relaxed/simple;
	bh=+qTqw8/h17z8nHtmZ+qAGtyYuOaPU8KGquqBPDOJBOc=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sUEuM4JdnuOGHuTMTu2vs830WS1eL7Ut/Ic/DahNwnO+jBLHPzw+Ro1RKF1Eywga6vuN3jtPAwKv3goh2mQHLWse4TFbs6BLht4YSOZOpzSBjHUVpmx4Hs7LmxwLpPgIdsCQ7METXV/j5WBni4zLmmfMAlMw11hKJ2evGVrlAFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=tbouiZBJ; arc=fail smtp.client-ip=52.103.43.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgNZvZe2tGPNSwYtqZhoWDPYPCQMn41fJyjacEIlJ0BqboQdnChgHvm/Crq8LPhc4DnOKdGq/u8rA6OaNTahMdSKIVKUVh7jjCRlg6JwDhd8rxd9g78I3YW6bS3S0twM9MxO8PHgx4Ho+4j4C9ozjBF8klsCDYQb6x3QBDjM0lOsQQ5C+CCxXkGwcVm38zj0vTTs+Fcw6HBZqsJU86dtJUkZ384r77f9KRpJ/RC34+jJ1c2okMY4J3vjtC0anUpWep0fazOt2TitW6b5xdZ4ClDsCQY9r0gZGXrhGYghLg4LZv5nkmL0oSIlFfM1tAZS8QAImNNQS6vGaRCKlURqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3K7RBB+WxdvijkT4OC2eAMFMQjEMZVwi2HvBseMsyMw=;
 b=M+OA6dgPHtWxtlTcKOLC8xbKKppjj4Sz4ywOjbLt3y10EEpOYIwEiIqzcnajF/bsCR2usiCmfFWxi9SUDyaGANK2G7yDi76dVUQD6h9wK7mSPblYkdvXjNkzOMoj3gfGESWPZGTfyDB/r82dp+g1bJKmbPkUM0lMnBlXQalTVRi4FV45CN07MWjasVE03Tim4+nufHNLd56PdZakFjCjGAKZN9lI+5PcNJzqCybYz5x+hXAkMIqdgDKj0wy+TTvubi5pLIIUDnVwFFdCz3mXF3oUNu7rkHWjWyhRdrCH9n7wiDSHvSLr428HqECjjTQ5IVnWnZw8uHa1eC2J3u2cvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3K7RBB+WxdvijkT4OC2eAMFMQjEMZVwi2HvBseMsyMw=;
 b=tbouiZBJNOxwRInqpbzfxCwzlCCVBLAHHX6q2PUAl17NfgZJEPOtUvq5+ojar58n5s6x+0Unnp0442BldNbEt+5+AOXAiLeWd/hoLYQjWciNwVZpK1tTqbQRaKJ5KWrXASoAPxQS2yjjfxQgZRCGD+OAolr+DPkLdw+RogbmM/IZPgt1QaQmxDGE2UwyVnZVE5nQVWiH5dvXWeEf/YzDVsUFEjO3oyKPXVreP6upAsPrssn0mpKU4h8H+WK+xYQmEtErZjxUBKN2tpXqOzwl8f2rX9YoQUAnIXrSAzEzclGkLw/RnZX2b3S5RnqhlUMG4QDG/F4BMSiwGvcrFWaWBw==
Received: from OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:198::12)
 by TYWP286MB1990.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:165::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Thu, 28 Mar
 2024 16:57:10 +0000
Received: from OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM
 ([fe80::32e2:35ce:a8dd:623]) by OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM
 ([fe80::32e2:35ce:a8dd:623%6]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 16:57:10 +0000
From: Cui Alan <AlanCui4080@outlook.com>
To: Alan Stern <stern@rowland.harvard.edu>, "mathias.nyman@intel.com"
	<mathias.nyman@intel.com>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"kexybiscuit@outlook.com" <kexybiscuit@outlook.com>
Subject: Re: way to notice user when a device connected to a inappropriate
 port
Thread-Topic: way to notice user when a device connected to a inappropriate
 port
Thread-Index: AdqBMAsyIUVKSftLT9+joUQQVsULSQ==
Date: Thu, 28 Mar 2024 16:57:09 +0000
Message-ID:
 <OS3P286MB2213ACE7DE8379B900BA1D72AD3B2@OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [XjhsVmA/zO8F5Y9cK64UVozFW5jtKV1l]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3P286MB2213:EE_|TYWP286MB1990:EE_
x-ms-office365-filtering-correlation-id: 4dc1731a-700a-4def-8ef5-08dc4f481ba8
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 uxHUzdZtM1gwJ/rWpeOKa8NlqhazDlbrt4k18/J79kJcZUoV/J7ri6TExcyWZTWjB6CPpwXeXSpzaYfquX8z8VML/o+5Z/jQlqSCYdX7NA+acAzStrrNtTba6/+XCu9DcF8v3Aq2JwF+czDA2qKxuvLX93/kRY0o6s6d7Xpo0B7Q37adA3t1pJRTmtMaeJ2DZcN/Wn8LzWkmFl3XSX1I5ISc7GOB70lLYeVbwgppL8IHR+JRgEsfaR1tWycuF+XNxOOhn9YQ6wbGQUFij26Cj9iYJgblhFQSq/7S63EAg8ZbpnEtsLGDrMX0mZG074AOgqwInA1HXFKiDDtQAglgetPUQawC/ZweZCeVoXwTIIBMioUbO0IN82f2s+eJ0h3HlQdS+WnFcu1DaajR2vGYVvV7nmUHRPLrUMbzHUSWDUpwstm6FD6qcQI9W4s97SMsL13EFR3GdMHCfx368S+IAk1vuCscmg0afixURhsDTGYnGUCtCEFzd0QS8oIxyyJbREav3fG1OWEQ4dboIj1FaaTlhEki8mZWfhXol9/CC/y2y+xrwECgk2iMR33jVrBR
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?j3kBDP5wwXW9wHJjl8MuefxuvGymqnCOxMDLapIWZjZsN9dB5tqolWjsnpxQ?=
 =?us-ascii?Q?A/bD2Nys+pNsu1t6PcdZzg1ULvONK0u+p4lenOvGmzcfZCEKmmOShvzD77TX?=
 =?us-ascii?Q?4kT826CjybzJCsOqvyS3jNi2xwZzFyAIhyHSW9UG7/V+EBQ+b3u8vpoe6XDz?=
 =?us-ascii?Q?IZhEyK4kBQCWPj8vul6XdJHzV4CEAW0oWYafYQCsLKuAFa3ap3nv1u3g8H3X?=
 =?us-ascii?Q?wIDINp9Jg71lG86HNvu+IP5xsLiu3W0WO3tPUDAJouuFz7yXCXRL/w8witkh?=
 =?us-ascii?Q?EBfFQJP/YqtSdmRssURh/NyD5KcBNTd6QFI5Shc4gxsiu8sYC1XB6Y5Pfqnu?=
 =?us-ascii?Q?fMN5/4UdNiQlbUiFUZMsntvVuDyMh783k10+Z+nPNfh0TVmYVMRrbceNKU5B?=
 =?us-ascii?Q?i//yurPQ5FjZyONkk1vCBmJNsu99vZGrSE4weoCdWfWYVklvuFrKzkVdUZvf?=
 =?us-ascii?Q?2uYKiX1d2YxxjyhCtNMBoTbAz0q8y3QUO72jZeXzVNCdrSFhsVaBjqArHi7/?=
 =?us-ascii?Q?oU/Hevwc78vSQa6Yy6N8ScprcsZ+7LvHri6beeXNJGipkMXdtFYJqOq1i7qV?=
 =?us-ascii?Q?HzFGBspTohjvROPNHGLI1l6+WndaXHr/SeXIWxROxINnS2ET2yxqR+R2c0FE?=
 =?us-ascii?Q?ZYQ+56jsYcBsdCusgBMrMXRufvxarczRGar7kn5Lq4ILGHlbvK8OUHjmeK7s?=
 =?us-ascii?Q?ZvDWRl32KkR+hcnhfJyLzFkXWMlFd3345qPVytdRI2O/t1l6n11+nhwsk5j0?=
 =?us-ascii?Q?IoYpJE7E4IKyn/0AG1pDxXMDtLIVnrWsU3XeDDq6KGyqossPKiVgb2IT2s7s?=
 =?us-ascii?Q?jGa/03KqCgDmHW8uofAAhgnLMh//YfBZm6ipWJEQNwFjvruuR/1tPTXTqxFh?=
 =?us-ascii?Q?vA8Me5agS90ny3AcW0HR9xJd3o2sIcdayRsuz2XF2bZvzaQcr1xjEK38Qi4M?=
 =?us-ascii?Q?9TDd8vd+B3a9IYF5jDQHyI2FUeXO8eU3JdvoOo9OLZREI2mNTXxCabto/7mE?=
 =?us-ascii?Q?mKh33AqeZ+uQjbjzjdtsZfAc32RjdkjnRDlxhP6xngj3jxcrdLEOt9RhixjN?=
 =?us-ascii?Q?7ghN7/YyCjuVAznjzAMF9Ic1lrQ3DhA9qp7TnapiEQ7ECdzB39CNg54NF/OR?=
 =?us-ascii?Q?cycZ1PfdQX9zi+aNNYJMkxL0I4qlgMBw43SQ3DlNHOi8w5+TWKxe7m82McWG?=
 =?us-ascii?Q?reRpNt3ERobWTSNPE1YPgBFqb6frn1e61cKw10F6urEu93snYVtfyV4qbkI?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc1731a-700a-4def-8ef5-08dc4f481ba8
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 16:57:09.9671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWP286MB1990

> Sender: Alan Stern <stern@rowland.harvard.edu>=20
> Mar 29, 2024 at 00:22:10AM +0800
> Recipient: Cui Alan <AlanCui4080@outlook.com>
> Cc: inux-usb@vger.kernel.org; kexybiscuit@outlook.com
> Subject: Re: way to notice user when a device connected to a inappropriat=
e port
>
> On Thu, Mar 28, 2024 at 03:20:10AM +0000, Cui Alan wrote:
> > If we can query the capability of the root hub among the whole system,=
=20
> > to indicate if kernel should notice userspace that the device is=20
> > pluged into a inappropriate port. When a port with higher speed and/or =
more capabilities the device required is available. eg a dp display device =
on a normal typec even usb 2.0 only, or a superspeed device on a usb 2.0 po=
rt.
> > (Windows DID that)
> >=20
> > Also some non-standard device only provide a usb superspeed without=20
> > usb 2.0 even the specifaction says
> >=20
> > > 11.3 USB 3.2 Device Support for USB 2.0 USB 3.2 device certification=
=20
> > >requirements require support for USB 2.0 for all user attached devices=
.
> >=20
> > I looked up the USB BOS descriptor and found that the field describing =
the device's speed capabilities is one-hot coded.
> > So also the device can put a billboard or BOS on usb2.0 to indicate it =
cannot run on such a port.
> >=20
> > struct _SUPER_SPEED_USB_DEVICE_CAPABILITY_DESCRIPTOR
> > {=20
> >     BYTE bLength;         =20
> >     BYTE bDescriptorType; =20
> >     BYTE bDevCapabilityType;  // ONE HOT BIT CODING!
> >     BYTE bmAttributes;
> >     WORD wSpeedsSupported;
> >     BYTE bFunctionalitySupport;
> >     BYTE bU1DevExitLat;
> >     WORD wU2DevExitLat;
> > }SUPER_SPEED_USB_DEVICE_CAPABILITY_DESCRIPTOR
> >=20
> > I search the kernel source, but nothing shows that kernel trying to not=
ice user or even a pr_info when situations above happened.
>
> There is a message that gets logged when a high-speed-capable device is p=
lugged into a USB-1.1 port, but no message when a SuperSpeed-only device is=
 plugged into a USB-2 port.
>
> Would you like to write a patch that produces such a message?
>
> Alan Stern
Excatly, there are two situations I said above " a SuperSpeed-only device p=
lugged into a USB-2 port." and " a device which supports SuperSpeed plugged=
 into a USB-2 port.".
Maybe its more secure to ask the XHCI mantaniner before we do that. Looking=
 forward to reply from all of you.

Alan Cui


