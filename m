Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A47C82E3BD9
	for <lists+linux-usb@lfdr.de>; Mon, 28 Dec 2020 14:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405273AbgL1Nzg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Dec 2020 08:55:36 -0500
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174]:62048 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2405266AbgL1Nzb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Dec 2020 08:55:31 -0500
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
        by mx0a-0016f401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 0BSDpO2m014062;
        Mon, 28 Dec 2020 05:54:47 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pfpt0220; bh=RXqwMGuSmg8RZtCYC3REEyB76hhUGLvPpJhAnn+vt94=;
 b=HydxWTyS+rDjB6OtycbGjBoZ9pA/kAVYSAvpLSl3PkGi4LI696jUQF5HxfC4ndK1/7Wc
 rleGboquQnOQSCaDg1fRckbNd8+/9cJaNITHHBslB4fPquhjyPqJQaUPGQJoAfEogo8x
 qLWe0TKUqpF+3Ck6w5FZaHwSmTpN8i6iE1GotrgnS4oduBaK+xU5ehP2v6DnFAG2QnXo
 LBuyikIDMNYzbWgEgQDtHfPDK4Kdksa/3zpgC439rjrRI+NpQ2KD+bb0zkccF84wKpdn
 mWS1lFfvIsDfQas7YNWpTw1pLXcznkuA1pRopCy2HGyIkAW0XS6y9vwMpznlaf5WE8+r yQ== 
Received: from dc5-exch01.marvell.com ([199.233.59.181])
        by mx0a-0016f401.pphosted.com with ESMTP id 35p3dsk963-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Mon, 28 Dec 2020 05:54:47 -0800
Received: from SC-EXCH01.marvell.com (10.93.176.81) by DC5-EXCH01.marvell.com
 (10.69.176.38) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Dec
 2020 05:54:46 -0800
Received: from DC5-EXCH02.marvell.com (10.69.176.39) by SC-EXCH01.marvell.com
 (10.93.176.81) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 28 Dec
 2020 05:54:46 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by DC5-EXCH02.marvell.com (10.69.176.39) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Mon, 28 Dec 2020 05:54:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=agWCyk24EBWIWoqNfih2qTbJjuSvsvkpFu4EQPRrd0ZyLqaZ6e3BTAOzjGD9RlHaV2vP7nCsj7FV8gxY5npWFD8OgAmknE9OO3fWwXlJTVBz0P+L6pukOpIZMyh9IR1NeNrgRcXoqIJPhFMRS7l+FxNZ8MNFutr29z7y0n5YoGRCliFtgZDpEPB1uoT+adaB3GlIdPG3MpMjc0S+PRq1fMIYlAt6Haok4rh3jBs1C3KA+q/mhbtJDO2WRruHmwsvpyAM2vUUE55VinWDYbS3L2+gnUcOv31SVYGAeg6u3peM+16Q2p1TeanyzDtP0Jq/DoAC7JKkcOvt7h/3ptYXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXqwMGuSmg8RZtCYC3REEyB76hhUGLvPpJhAnn+vt94=;
 b=iFrYg4t6iSsjQW7S1c5pUq+45RZ50/4RIEHPErDEWlcXbhSOAnMP3K/qqWaDk3lxJQTAhboaZKLbZncmQKnkr6zLyJUQtezoYAP7heaASsG/jk3/7qydWznx/WtdsFMw4a7wLi/v9Gc6MP09hhxiKkmCgmnsafAONLNeGTli4qtpUge7qTA/48uC2tGGrQesfcsfqo4AX6wvcKY5KxVg5figTq1tWFouty+OXylIPCb0KommTt7vuMr1uUtYg/r9NnnSx8TATqF510LlNbDfbow12IDYSnW0chJz4NxUOQHS7T6X5+mLkUuw3n2UpV3vhGK8KS6gydhT1LW8lCPxRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marvell.onmicrosoft.com; s=selector1-marvell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXqwMGuSmg8RZtCYC3REEyB76hhUGLvPpJhAnn+vt94=;
 b=qM8G2uQcZmc/eR8MBtCpEgob9Xc0XllSJEyTe3h0iVhhtWbWvy0gsX+MY56qTJ99T7G+B3IEVm6OmVh0MPsBm6UhcDaElp9hgmVEZ0uSKSKu98BRvNibtmn2CLGw/KjfBnqvl0ijgMBvjddqVv7Hu10fM2xitgAXrTP8pHlhv2w=
Received: from BYAPR18MB2741.namprd18.prod.outlook.com (2603:10b6:a03:104::31)
 by BY5PR18MB3156.namprd18.prod.outlook.com (2603:10b6:a03:1ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Mon, 28 Dec
 2020 13:54:42 +0000
Received: from BYAPR18MB2741.namprd18.prod.outlook.com
 ([fe80::41aa:4af:817c:759f]) by BYAPR18MB2741.namprd18.prod.outlook.com
 ([fe80::41aa:4af:817c:759f%5]) with mapi id 15.20.3700.031; Mon, 28 Dec 2020
 13:54:42 +0000
From:   Noam Liron <lnoam@marvell.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg KH <greg@kroah.com>
CC:     Yuval Shaia <yshaia@marvell.com>
Subject: Enforce USB DMA allocations to specific range
Thread-Topic: Enforce USB DMA allocations to specific range
Thread-Index: AdbdHEmZFdbher7ITx64r7D0fwV3Sg==
Date:   Mon, 28 Dec 2020 13:54:41 +0000
Message-ID: <BYAPR18MB274197EFE1391905899D2F07B9D91@BYAPR18MB2741.namprd18.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=marvell.com;
x-originating-ip: [46.117.46.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffe3364e-6af6-44b2-81ef-08d8ab382054
x-ms-traffictypediagnostic: BY5PR18MB3156:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB3156C076CFA6994F734B0A60B9D91@BY5PR18MB3156.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pu0XFbHXWx5QINyu+GdT12NdNtfXDCJ1iDAKEaQRwWjOVZWKSNx/QZmXhMyxPKMnMn5oIvbC3ESyYXK3fzNYW1v+MtdpDL0Wv7FkNTeAGmqNx7snrlW624tktilL/5uML7qOJqaP61rquippi2qx3w0ZKu1koEst5UchmirdsgvH/QuKoC+sHYUq1zKjS+vB+3FqHb/fiNIpO8zsdWD/qhngUxcHX/+krEDVBdkkfXsTIHU5NiKj5FpM6zmI6Pj07xDjjUpwhcXQiJZMcY7nyecWYyS6253LvjW8s0054yGO7NAVhr34dS0/cUWrFPUmk9Bottu8IqRttozREKqBp4ZpA1xBElJ/sVkcec0SqszCtBLRHfridJsNjhiPFffncl+XHS4s5nzJJvOuYnBzPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR18MB2741.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(366004)(376002)(396003)(346002)(5660300002)(9686003)(33656002)(66446008)(52536014)(316002)(8936002)(55016002)(6506007)(2906002)(83380400001)(107886003)(478600001)(66946007)(4744005)(66556008)(86362001)(71200400001)(76116006)(66476007)(64756008)(8676002)(7696005)(4326008)(186003)(26005)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?C7u6e1MUvlt15Z+ZH++WRpcVWf7BbBic7SHfJGfochu8dW3czcHFzhwlhsJR?=
 =?us-ascii?Q?glvfsdn4N1EpXjixsJoeN46ehO05/iVGhHnOv5GuBPi0751a821k0qk00Uam?=
 =?us-ascii?Q?t75lgVtxBL8euiTE0/iNryBFHHJclguyybOQmRrFQWtRTitkaciz6Sg+X1zW?=
 =?us-ascii?Q?GTT2oCIMs3LYwkHxq4oTq3+uytS3kxJj0epoBlnh25iLcH/QWDwuJOHpWyYp?=
 =?us-ascii?Q?3RX38M72b2pzCj6wACeVEyGGb+S9AaHzqYFrIanAyKnOBXfv0H6RUwcRKkPj?=
 =?us-ascii?Q?C3Ai7u4vyekJYLT7krcyY3Tq5SuzAE6ib7qFDpEbFeXlHTwzlHmrninLPVmq?=
 =?us-ascii?Q?/S7s5nDioadsAwNvNrvqGl3Y5Y1Zp1jSVuPM7ZQ1wGcif2QiV1ohzWiM0Aua?=
 =?us-ascii?Q?y0ibeArfgfyBMuNJJMxU/LLjDZPhcDVfpiUGj0tmMG/e2xK2BFuutf8coiv1?=
 =?us-ascii?Q?h/OmMv+deeP/9P9neN3mizfNdrt6h1HxHPdCGmCYd+4sx6xw5hOk+88N21cn?=
 =?us-ascii?Q?yE33hggJhkjMUkJVKCvZER53FXX+c5MrvaPp0nNlKwNDolZK9Qj+AQI3zqm0?=
 =?us-ascii?Q?d0PojQmUBQS27DwTV4thC+rehiTtzLjXeu0znVWmXFzO+ZOR/ek5aQR5mpgh?=
 =?us-ascii?Q?xvX4wBKXKKv0Vx4TazT8+2tH1g0xEsoxSsPaW6YKHfz0To/8+3DyOGNWA9vs?=
 =?us-ascii?Q?LDKS3GwVt8nGzLI+fZZ5orfcbvioaFE5Wf6lcTEkMygxP1ze/ZExtmAiwLv4?=
 =?us-ascii?Q?HwnHyrO5WXC+eTzO1Byl+kHaYmBYXRetygdwm2aoW1+Hpf6Gvco5mSoI8nKO?=
 =?us-ascii?Q?sR0CUtgIZfnCDukWIZqxZee22hprUUAcrf2FrQayRt0gdj0Ew0nE837px/Wc?=
 =?us-ascii?Q?zZRm/kVTSFgQy79ubiAsOTDkrqS1MfkDN3gxU2AzUZmeDGIf+HMBTtTmLA/N?=
 =?us-ascii?Q?AzK5FP7OLeox4z7CjXy0H74P/tXvfRzKWkDHxj3jLtQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR18MB2741.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffe3364e-6af6-44b2-81ef-08d8ab382054
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Dec 2020 13:54:41.7365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XSTpuZWswibRkO+dQ9fx6SaPVHQAla0hkqcfuKZQIOd74NFZU3u1cIyFCovnqklFI6WASEFcAQpiMCsDawAAsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3156
X-OriginatorOrg: marvell.com
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2020-12-28_11:2020-12-28,2020-12-28 signatures=0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg and thanks for your reply for my previous q. (Proper way to set a D=
MA_MASK on a USB device).

I am rephrasing my questions:

I am working on LK 4.14.76, on a SOC in which RAM starts at 0x200000000, an=
d need to limit DMA buffer allocations to be at the range 0x200000000 -  0x=
220000000.
This is a SoC constraint.
Setting the controller dma_mask to 0x21FFFFFFF, didn't solve the problem, a=
s I noticed that URB streaming DMA are first allocated by kmalloc and alike=
, which are not affected by the dma_mask.

I plan to do the following:
Alloc coherent memory for the HCD using 'dma_declare_coherent_memory', and =
use the HCD_LOCAL_MEM so the usb core is told that it must copy data into l=
ocal memory if the buffers happen to be placed in regular memory.

Is that the right way to deal with this case?

