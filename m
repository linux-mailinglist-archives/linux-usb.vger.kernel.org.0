Return-Path: <linux-usb+bounces-8523-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F57888F5DB
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 04:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A2FF1F2C83F
	for <lists+linux-usb@lfdr.de>; Thu, 28 Mar 2024 03:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3460E2D05D;
	Thu, 28 Mar 2024 03:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="HhEs0c3X"
X-Original-To: linux-usb@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2067.outbound.protection.outlook.com [40.92.99.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B171C680
	for <linux-usb@vger.kernel.org>; Thu, 28 Mar 2024 03:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.99.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711596014; cv=fail; b=SOKBLWWlGxdCBmGa7N4yG5eq+7813QZYsbkKlaRHaQbDFvKxvwrn68Ipl5w7xFIaiaYfneTnPddPAjHr8PSK2oVmsMEu42CDdeOCpVIDGam6LdzB5AEfXTjYGMqAHN4T/v4y2uJ8BafFeiKEZy/MNEETXe4sZ498i1V7dq1elCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711596014; c=relaxed/simple;
	bh=NDc781kAH6QhO59Kb4VsVXDJ0ZzyStlPUnQm6QKhH/8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=E0SsLTqkdhy7XosHzcLi3GMDftNHkL3BULHuvfi/zwXWsecPuju6CbTsDgvSKo9eQLhdJQRi/UJVp9Uk4/A9Ahj0B1SQPIOtHTs1Np9c/OnDPnqXjwAo+fN9rTsU2y5ZOd+XPqKp4gjf4nkdlDHneE7m4mrqeYFJ1JIc8Iqmalw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=HhEs0c3X; arc=fail smtp.client-ip=40.92.99.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X+s2IgVtPKVWEplUukwGku1Fo6IZOT1SCgOqYU00WqGDeSKauzn67sMb72vLDvb1fJwOb5vpb6q68ya4KPs7ARoCNoKXwAC9YEGlpUtDcrIF/IrKRBg07YGFpLQeOojdTvWhmv+Vvb4gPsnIucMIYkev471Hsy42Q7/gDGtVQ5uSjw0WjNTBDLOsN7AZCEuixB7zn/bQ34LxVlI0q8kNm1RousjCfBXHbfFgzujmgYAQIL6YGRZv6SDxccifEwVMtl6YX8FMLFsT8CUQj1+z8wftxoFppXhnJf2L4BzCsLRXJlHDVJFbX97XqqdmsN80YnXzovE5E3Uwj7W5lUlt7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOd5NDohPZnl3+QGkFq9jder4b8mmvTX8lcXiHRwYyc=;
 b=TwQ5MOrEveR+WCUcY3k/t+RmTkKXo2+oec1rHPwBk0nH2M4KU+yjzYsiyVxGl9jGwxbErCyABcFZTjHa0eUJbQnSs6fUJ7DU0LcKp30fucyNbce0FJXsnJuZcFwEDcubK/qEddDWGDYzragVMCJWZiI1A7CDlicY9W2JtjfcsCeEniO9hLLTifKcgg2eSN5ttAGaZiolwbfCaQ53/fO0ZJfbH+5IkXER19lMmmHDIy38B3A04vkCIAt8e4tCplKSWSRPQJTNDoQ6R3c2Jbl7ju2eyhc3mdxIsnEAWHx7eUEuP0rK4Tr+OJlt5ufd47uEtypkHz7CVxLg8OSumC+6fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOd5NDohPZnl3+QGkFq9jder4b8mmvTX8lcXiHRwYyc=;
 b=HhEs0c3XCqxpWfMV/MXmRhlk3HtvJ6t5ssbVFbffZEYIwpW28I8kVYYFClSx/ySKUNFx6d0N//nCUzphb5n8DxXAIbgzOVSqUIaWhMqyfrg7uRzXPkyawy4ahoWrA2liJExM8K+UsNQtlSiwMHOb6/Z1SZLK8Vnk0UvDOjW5IIdblvBZ4qnG8gVTURHQrnHA6a6ddAWDhEAr7KTGNrhlTGAZDXq+URqXUthwLDQHST2jkKRB1CrBTSNzT9EPX5S6b5gkRK98MwZFQ4qLZQRMhybJ9MkLCrhMJufkhUeAK/EKfo9wRmxzkoqSZ78/WYq8mNSm0zZJp9wQ6W4mMzeGQQ==
Received: from OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:198::12)
 by TYCP286MB2383.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:18e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Thu, 28 Mar
 2024 03:20:10 +0000
Received: from OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM
 ([fe80::32e2:35ce:a8dd:623]) by OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM
 ([fe80::32e2:35ce:a8dd:623%6]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 03:20:10 +0000
From: Cui Alan <AlanCui4080@outlook.com>
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC: "kexybiscuit@outlook.com" <kexybiscuit@outlook.com>
Subject: way to notice user when a device connected to a inappropriate port
Thread-Topic: way to notice user when a device connected to a inappropriate
 port
Thread-Index: AdqAvJPugSvJbmEqTS+0H16miKowdg==
Date: Thu, 28 Mar 2024 03:20:10 +0000
Message-ID:
 <OS3P286MB2213E43C0914C45196A29293AD3B2@OS3P286MB2213.JPNP286.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-tmn: [N1w/0PT5HDIrYzFW89vE2y3VpG6mHuOgPnUyA1Y7XCH2rnh0OcSkKDYio71g2CK+]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3P286MB2213:EE_|TYCP286MB2383:EE_
x-ms-office365-filtering-correlation-id: 93824c33-f21c-4a48-7ef8-08dc4ed5f9a2
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 E+z5g5PKfMLIGgkTMpRvj8PMTXURXbHGZ1UZnsvnwensT5qdi7R4wRJBROk97Gx9YjbXaC9W6RqSG3qmA2D5Bu1Upi/R8zcDcStMeiEiQdTSJ33BXmZl46zTRzborwHfJTj46oaUDkGuVZTa6kuipc5L3F7KdwXIrTBrS7xX27qEMdSdRHfMyoCfU8LCiKK+vWIqya03MPtwETxW9hKrV7SijRdZxwt02TvxU+E1lmiNjl1OvLzyBCy/fJrOP2FhPIlSx3eMdzOUrqKZRoXodoB2yKynC1mAEytABUiPIo0tADmqITKbjLGUiymCxBRwprlWeLtkmBUJVXU63XYzoH3xrYX20SrWpQg8rXch/LX1CvAxm6bnACdJE6Ky/o1cqN5IjZ7dS4TugqAKFsIbVGXM88aJKin8GjPohjVmnpVrjAR5EezF/4r3h04SWbwDnV7dz79zhnaPj6JBTEH8TZe5ox+3wpziKRrElzjH5GF6I06PKoUcFsjl4+b6uNvBDM3khS5b/RhNrpoHgEylufoX1GepBFwMRuP2UAMKnG4/ln9wcVyFCN29kpdy38J8
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?u4X2U9szeLNLdTc26l4cqddlW5Att9VSNJ7gLQBjd2vYMyS3wbpKNTx499UN?=
 =?us-ascii?Q?o53JNYwM9a/TaxtxHUeCaTA+HskttBE1RFowH35u6eIKP1+SNXG+dCoWHzev?=
 =?us-ascii?Q?nUOK89epJ9oDH4WCJyILVIoI0kwuohJ/xaS9r3mqxMcWP6vdsImnyx7DFvYg?=
 =?us-ascii?Q?q5/e2Tw/eaJsC6rW6XuQG8w8bKi/+5D1OhlkAT+A47lOKTGzm4FKoUiILJ4n?=
 =?us-ascii?Q?I3AJM3v+RJYCFy+jOEWVVvc3hzgPZVo0wI/Vkrnf0xOi2QnZIm9LqiFmLWx6?=
 =?us-ascii?Q?BUAwC+Hhd5dYVorOy/zmPp+rqSS2d2928YCJ3opIuRZ4Z3PvgGcWehCYx92Q?=
 =?us-ascii?Q?XmvUfvE4v7oBiCWIbasNoH7Z+a03kSQIeqgWfEURVKHWhdnLYDGzEAxtz63U?=
 =?us-ascii?Q?muXezoalk3Tq/F+r2mUS2JocZdMqvOZNEvEMjaUggSq44tWBe4YfWMkaqKs7?=
 =?us-ascii?Q?nJQnLu5VB/MLuXuXEIbZEELCfITOwxx3peozRpcyAW9f0A5WlsUKi1yHSpG1?=
 =?us-ascii?Q?emnNOt8QILdpGAyhYqBcia1FvaWl06zdA0BhL9QRYcyhnxznwaLgUCRhtMZH?=
 =?us-ascii?Q?GeGZPsvXzJbAQq8YZLBpBA12WDrLJCKGDKrTOqaZqdr/liFJ82RWyWcKcJxw?=
 =?us-ascii?Q?rJQPj78PLR1vAPCfmLVjCWShfBQR908NMXuxqLH10vpOh4cJMTRa8+vE/uQG?=
 =?us-ascii?Q?wCCqDd9WJIzBNuzqo0nttVsbRCqYGJprqaV2+vi/SKmF0tlnUMjqbWbNkrw5?=
 =?us-ascii?Q?xHl7/PKtlXN6beY6mhtpYNO48KltjyKknvvy8oHbz8xukm3j6jVku9H2ACt3?=
 =?us-ascii?Q?d5I2EUyOZSZWqRhhC9ZKj/XOYDmthdM/KrRHSdL8z/RT1dleNPRFkXJFt/a4?=
 =?us-ascii?Q?ZQXq9jLbot/iplhVZNB52vuv4uYyr9oqcwDwwgfXPN9X9oAnaLIYwVbtsKXA?=
 =?us-ascii?Q?jlDXda+L0yunjH6RxnHwGuJOGbQHSYwldd8tuq5GugbZQE88rZGvgqjo8Ege?=
 =?us-ascii?Q?e4s5gzalttLQ/59E2OlB7FzmZxUUB5TlKIW+fMaY6u9CNevz+1O621j7WM/J?=
 =?us-ascii?Q?fQIwHRyAVPQsxvdapCVdr6taEHOcQamGVIlhQrraAplYs/rmotWQ+0D519vh?=
 =?us-ascii?Q?2dKEad7wmwyPefVfHgW3pfWfXsr+mnKszVFWNOr+gOlsGcxe6ipFUKI2bCGp?=
 =?us-ascii?Q?OJREll1vbC/HGvVQC0C4J+h59WvrskutZxDJMRrZo8OQuL5UMFMHV4Pu/QXa?=
 =?us-ascii?Q?VriRHgPSss2zr18Qq01u1E0gqGP28PCOa1RowRPjobgh6egZoreCWt4X2QTI?=
 =?us-ascii?Q?1Z8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 93824c33-f21c-4a48-7ef8-08dc4ed5f9a2
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 03:20:10.2473
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB2383

If we can query the capability of the root hub among the whole system, to i=
ndicate if kernel should
notice userspace that the device is pluged into a inappropriate port. When =
a port with higher speed and/or more capabilities the=20
device required is available. eg a dp display device on a normal typec even=
 usb 2.0 only, or a superspeed device on a usb 2.0 port.
(Windows DID that)

Also some non-standard device only provide a usb superspeed without usb 2.0=
 even the specifaction says

> 11.3 USB 3.2 Device Support for USB 2.0
>USB 3.2 device certification requirements require support for USB 2.0 for =
all user attached devices.

I looked up the USB BOS descriptor and found that the field describing the =
device's speed capabilities is one-hot coded.
So also the device can put a billboard or BOS on usb2.0 to indicate it cann=
ot run on such a port.

struct _SUPER_SPEED_USB_DEVICE_CAPABILITY_DESCRIPTOR
{=20
    BYTE bLength;         =20
    BYTE bDescriptorType; =20
    BYTE bDevCapabilityType;  // ONE HOT BIT CODING!
    BYTE bmAttributes;
    WORD wSpeedsSupported;
    BYTE bFunctionalitySupport;
    BYTE bU1DevExitLat;
    WORD wU2DevExitLat;
}SUPER_SPEED_USB_DEVICE_CAPABILITY_DESCRIPTOR

I search the kernel source, but nothing shows that kernel trying to notice =
user or even a pr_info when situations above happened.

