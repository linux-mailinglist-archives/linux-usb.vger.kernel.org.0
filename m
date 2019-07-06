Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147D0612EC
	for <lists+linux-usb@lfdr.de>; Sat,  6 Jul 2019 22:24:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726761AbfGFUY4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 Jul 2019 16:24:56 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:14470 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbfGFUY4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 Jul 2019 16:24:56 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d2103910000>; Sat, 06 Jul 2019 13:24:49 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Sat, 06 Jul 2019 13:24:54 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Sat, 06 Jul 2019 13:24:54 -0700
Received: from HQMAIL110.nvidia.com (172.18.146.15) by HQMAIL108.nvidia.com
 (172.18.146.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 6 Jul
 2019 20:24:53 +0000
Received: from HQMAIL111.nvidia.com (172.20.187.18) by hqmail110.nvidia.com
 (172.18.146.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 6 Jul
 2019 20:24:53 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.56) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Sat, 6 Jul 2019 20:24:53 +0000
Received: from MN2PR12MB3389.namprd12.prod.outlook.com (20.178.242.161) by
 MN2PR12MB3742.namprd12.prod.outlook.com (10.255.236.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.17; Sat, 6 Jul 2019 20:24:50 +0000
Received: from MN2PR12MB3389.namprd12.prod.outlook.com
 ([fe80::7950:c1e1:a6a6:40e0]) by MN2PR12MB3389.namprd12.prod.outlook.com
 ([fe80::7950:c1e1:a6a6:40e0%7]) with mapi id 15.20.2052.019; Sat, 6 Jul 2019
 20:24:50 +0000
From:   Henry Lin <henryl@nvidia.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: fix length check in xhci_align_td
Thread-Topic: [PATCH] usb: xhci: fix length check in xhci_align_td
Thread-Index: AQHVMpcMvKoVExOcM0W9BnADohjBLaa+C/0G
Date:   Sat, 6 Jul 2019 20:24:50 +0000
Message-ID: <MN2PR12MB33893D96E1517B67A527B330ACF40@MN2PR12MB3389.namprd12.prod.outlook.com>
References: <7c2f350f5a819f268d5f9f541784ccb073a35786.1562264858.git.lorenzo@kernel.org>
In-Reply-To: <7c2f350f5a819f268d5f9f541784ccb073a35786.1562264858.git.lorenzo@kernel.org>
Accept-Language: en-US, zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=henryl@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 31af75b6-234a-4e53-ccce-08d7024fff4c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MN2PR12MB3742;
x-ms-traffictypediagnostic: MN2PR12MB3742:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB37425635A758B74744974C7BACF40@MN2PR12MB3742.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 00909363D5
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39850400004)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(14454004)(66446008)(64756008)(66556008)(66476007)(66946007)(73956011)(76116006)(486006)(446003)(86362001)(476003)(186003)(5660300002)(14444005)(256004)(2351001)(52536014)(316002)(26005)(7696005)(102836004)(76176011)(53546011)(2906002)(6916009)(6116002)(3846002)(5640700003)(25786009)(33656002)(68736007)(99286004)(6436002)(6306002)(9686003)(55016002)(53936002)(229853002)(66066001)(8676002)(71200400001)(6246003)(7736002)(2501003)(11346002)(8936002)(81166006)(81156014)(6506007)(966005)(74316002)(478600001)(305945005)(71190400001)(6606295002);DIR:OUT;SFP:1101;SCL:1;SRVR:MN2PR12MB3742;H:MN2PR12MB3389.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: PlErSt6PHIfGhL/cNnWAWjdg6ZwEPtynUXIRZy5+ggaQexZXSKQEZsPR4CpAiVnhTS+YaE/YQe4SY2/iIWyaJ/H4Of0wDpUCTbjL+31S1oO/ENrdUkuzrix9QGEaBVhKLum3GlJ5Q7aPafiIp9PRaCra69smARwEE2qrn9wXfxqGrFJxauRVVTqlHHL3XIV3VueSc+Zsv3SIfm2IhWoo8U3T5nDeIZntq6mkgoeDYs46OqglYHjFrlZR7cyq+2TisQTGJIJ+bZ8t0i9ES0GtQnWzSQfnTahGJn8PcfjwKVq5EXVuK23tkSj50gWNOMtmVdIHvGtj0IVa2zHmUaEFcQhfzJvn/b9maWMZaYneI662B/X89KYUgbIO4l+3pMGLdOKFYHpdrqMnlem5/4Ck1LtGcBBn367RZPPj2y2bH+Q=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 31af75b6-234a-4e53-ccce-08d7024fff4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2019 20:24:50.2900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: henryl@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3742
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562444690; bh=Nbiv8gTB9lJw3c/Pc8LvbHgy2haBPZnj6TbmfTPl4Ew=;
        h=X-PGP-Universal:From:To:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-microsoft-antispam:x-ms-traffictypediagnostic:
         x-ms-exchange-purlcount:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
         x-forefront-antispam-report:received-spf:
         x-ms-exchange-senderadcheck:x-microsoft-antispam-message-info:
         MIME-Version:X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
         Content-Language:Content-Type:Content-Transfer-Encoding;
        b=ogILkVrNdLTiOG5z7U81o8PXrwkhAGcv4+HiMh/Jhy4l0o+3XkFS6k1/t5rjA0kxT
         fO+dPNac3ZTJg6ENJdLoAqE+qNhUQd9r4GoFGs87Ki80tYPmTRaelEZqjFhbzofwAK
         6bnJ+rpjKqhDoz1rJSdnLHhuYocuUs7JuQi9DMOt2pDQn1Y2xA662S/diXaaGd1PPo
         Yb/nMd5fx4SRXYKox7vN5niZTzhSykp799/lmX8LBha6BEXtwpkNExS37BUbfqXF0n
         9mQFmQCwjYV+8iFNWnQqG0aMIs8arGuT99pa5v8t7R+JVz3okFlEg2Z7zJdowokdXW
         MB6tlJxcI3CXA==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Similar change is posted in https://marc.info/?l=3Dlinux-usb&m=3D15615291=
6509643&w=3D2
________________________________________
From: Lorenzo Bianconi <lorenzo@kernel.org>
Sent: Friday, July 5, 2019 2:33 AM
To: linux-usb@vger.kernel.org
Cc: Henry Lin; gregkh@linuxfoundation.org; mathias.nyman@linux.intel.com;=
=20lorenzo.bianconi@redhat.com; nbd@nbd.name; sgruszka@redhat.com
Subject: [PATCH] usb: xhci: fix length check in xhci_align_td

Fix the following warning due to a wrong length check after
sg_pcopy_to_buffer in xhci_align_td

xhci_hcd 0000:00:04.0: WARN Wrong bounce buffer write length: 158 !=3D 28=
4
xhci_hcd 0000:00:04.0: WARN Wrong bounce buffer write length: 234 !=3D 15=
8
xhci_hcd 0000:00:04.0: WARN Wrong bounce buffer write length: 208 !=3D 23=
4
xhci_hcd 0000:00:04.0: WARN Wrong bounce buffer write length: 82 !=3D 208=


Fixes: 597c56e372da ("xhci: update bounce buffer with correct sg num")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
=20drivers/usb/host/xhci-ring.c | 2 +-
=201 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
index 121782e22c01..72fc6980c641 100644
--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -3177,7 +3177,7 @@ static int xhci_align_td(struct xhci_hcd *xhci, str=
uct urb *urb, u32 enqd_len,
=20       if (usb_urb_dir_out(urb)) {
=20               len =3D sg_pcopy_to_buffer(urb->sg, urb->num_sgs,
=20                                  seg->bounce_buf, new_buff_len, enqd_=
len);
-               if (len !=3D seg->bounce_len)
+               if (len !=3D new_buff_len)
=20                       xhci_warn(xhci,
=20                               "WARN Wrong bounce buffer write length:=
=20%zu !=3D %d\n",
=20                               len, seg->bounce_len);
--
2.21.0

-------------------------------------------------------------------------=
----------
This email message is for the sole use of the intended recipient(s) and m=
ay contain
confidential information.  Any unauthorized review, use, disclosure or di=
stribution
is prohibited.  If you are not the intended recipient, please contact the=
=20sender by
reply email and destroy all copies of the original message.
-------------------------------------------------------------------------=
----------
