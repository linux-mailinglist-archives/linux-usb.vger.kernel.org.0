Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 729725F4AF
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jul 2019 10:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726900AbfGDIjR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Jul 2019 04:39:17 -0400
Received: from hqemgate15.nvidia.com ([216.228.121.64]:5840 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbfGDIjR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Jul 2019 04:39:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d1dbb360001>; Thu, 04 Jul 2019 01:39:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Thu, 04 Jul 2019 01:39:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Thu, 04 Jul 2019 01:39:14 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL104.nvidia.com
 (172.18.146.11) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jul
 2019 08:39:14 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 4 Jul
 2019 08:39:14 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (104.47.37.56) by
 HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Thu, 4 Jul 2019 08:39:14 +0000
Received: from BN7PR12MB2644.namprd12.prod.outlook.com (20.176.176.86) by
 BN7PR12MB2628.namprd12.prod.outlook.com (20.176.176.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Thu, 4 Jul 2019 08:39:12 +0000
Received: from BN7PR12MB2644.namprd12.prod.outlook.com
 ([fe80::64f8:8368:5ac7:61ca]) by BN7PR12MB2644.namprd12.prod.outlook.com
 ([fe80::64f8:8368:5ac7:61ca%7]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 08:39:12 +0000
From:   EJ Hsu <ejh@nvidia.com>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Alan Stern <stern@rowland.harvard.edu>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        WK Tsai <wtsai@nvidia.com>
Subject: RE: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Topic: [PATCH V3] usb: gadget: storage: Remove warning message
Thread-Index: AQHVBx/hkpXR88AjBUqeS/qWG6pvZqa5E+QwgAFa/SA=
Date:   Thu, 4 Jul 2019 08:39:12 +0000
Message-ID: <BN7PR12MB26449A2DC32EC2767CBF6687CFFA0@BN7PR12MB2644.namprd12.prod.outlook.com>
References: <Pine.LNX.4.44L0.1907021007380.1647-100000@iolanthe.rowland.org>
 <CY4PR1201MB0037C93EC7F81A394008C4CCAAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
 <CY4PR1201MB003707DAF71D18538DB48230AAF80@CY4PR1201MB0037.namprd12.prod.outlook.com>
 <DM6PR12MB2651638C25685F2B95BAFA5ECFFB0@DM6PR12MB2651.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2651638C25685F2B95BAFA5ECFFB0@DM6PR12MB2651.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=ejh@nvidia.com;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-07-03T11:20:45.7533964Z;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=67b72881-bb1a-4282-9c25-7c632192d9b5;
 MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is ) smtp.mailfrom=ejh@nvidia.com; 
x-originating-ip: [59.124.78.18]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7cf12e5c-8849-40ae-7038-08d7005b16f5
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR12MB2628;
x-ms-traffictypediagnostic: BN7PR12MB2628:
x-microsoft-antispam-prvs: <BN7PR12MB2628D9C182423BC83769F601CFFA0@BN7PR12MB2628.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(136003)(376002)(366004)(346002)(396003)(199004)(189003)(81166006)(81156014)(8676002)(66946007)(5660300002)(6436002)(33656002)(8936002)(446003)(73956011)(71200400001)(71190400001)(486006)(64756008)(66446008)(14444005)(11346002)(476003)(66476007)(7696005)(4326008)(2171002)(9686003)(256004)(478600001)(76116006)(53936002)(66556008)(54906003)(110136005)(74316002)(316002)(99286004)(76176011)(26005)(107886003)(55016002)(68736007)(4744005)(14454004)(6506007)(25786009)(6246003)(6116002)(3846002)(86362001)(7736002)(305945005)(229853002)(102836004)(52536014)(2906002)(66066001)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR12MB2628;H:BN7PR12MB2644.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nvidia.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hk3vssyGNEOW1nIVtQLBIJoS9MwlMcHy41zArw7H7j9QalXozV/4TllCyUlba3dR8RtLE2hD3ovj7Zp1Da5pxMBUgwge4FlTwBv5Os+TNcJsS8VjTQHQlnkCDbKens618HOxwuFS6MFoUhOP3+hstRXt47GTokQKkaOKaC/98AC/Cra6zpHJlE4Z6AQ0oUGGTq0JIk6y7jm7miLkKdpl+0x1zU5pJJqNtTxVffvdeDxOIGCKXpIRKAB6KJKM1RzLRB/Iu4gCk/tlfGh4wW/4uXuRAP8lbTcUJ9EDCJEeWGpIPBW1koYgtinXWCg8GnZGbQrEMcA3ItJv9m42wzPeDjRdfhO359QN0N/VHt6oo0KGIgNry+EL5xx6vw98zSjSt8VaxxhXnlEE8NAql1UYHW8wz2ZxLbGY7egQwel8YOs=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf12e5c-8849-40ae-7038-08d7005b16f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 08:39:12.1963
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ejh@nvidia.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2628
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1562229558; bh=KYoL0EXls1P9Z3xqKopvFlELxDXchTML5NI92IUPG9Y=;
        h=X-PGP-Universal:From:To:CC:Subject:Thread-Topic:Thread-Index:Date:
         Message-ID:References:In-Reply-To:Accept-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:msip_labels:authentication-results:
         x-originating-ip:x-ms-publictraffictype:
         x-ms-office365-filtering-correlation-id:x-microsoft-antispam:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
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
        b=LyZitgmIGfyKwiH9g+cCn3flXxpmQ+vvnf0HhUCCAjWsNOLa6GJfHYFsAB8Ff8TrG
         PabxEroM1oi2qla5L3eZQIMRbEj+WsMsdTzaRbfq1dzrJAPxAT9jFNImPLzLCk6Jf7
         /rlRcPRsQqtugOcKqiWR6LA/OkAiKcHxJIb2SaqVhaASp+i92ne7GhUBMYcBp5nyhs
         ZAkiMPKKEbP1tCPB6/x1mtuzMTTtsn6LDlnBFYb2+dL+9YRqLh1KCRmvZuqejbJ6sH
         GuLfwQFjPUNQIVKghXivYK/rev9SOiLwM6H8dCIMOcLCEIekAnMBEVsv74T7MGvThr
         GP2XXCC9Uiu3w==
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Based on my initial debugging, USB CV TD 9.13 will consecutively set device=
 to configuration #1 by sending "Set Configuration" transfer.
So, in set_config() function, it will try to disable each interface first a=
nd then set up each interface. That is, the fsg_disable() will be called fi=
rst and then fsg_set_alt().
There might be a chance that the request (FSG_STATE_DISCONNECT) from fsg_di=
sabled() has not been handled by fsg_main_thread before fsg_set_alt() is ca=
lled.
In this case, fsg_set_alt() will try to queue its request (FSG_STATE_CONFIG=
_CHANGE) to fsg_main_thread, but find that FSG_STATE_DISCONNECT has not bee=
n handled.
Because the priority of FSG_STATE_DISCONNECT is higher than FSG_STATE_CONFI=
G_CHANGE, FSG_STATE_CONFIG_CHANGE will be discarded accordingly.
This might lead to the missing of usb_composite_setup_continue() which resu=
lt in the failure of "Set Configuration" transfer.

Will push a new patch to fix this issue.

--nvpublic
