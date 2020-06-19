Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5505201CBD
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 22:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390426AbgFSUu4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 16:50:56 -0400
Received: from mail-eopbgr770113.outbound.protection.outlook.com ([40.107.77.113]:4278
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389556AbgFSUuz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Jun 2020 16:50:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bDIeVkRHTHv+AJiKgtoPQPJiA6vMutxOSLqP0GE0FE6LtgljDbm5t2TNLB4iFTVAbNme6Y1V0Mx0oZlZhb+LsQLMN7CmaR6Rg9beGG05t+DiYDE7UrS89sfLxLmeoA1eB8zrxT+vcWxiTj/xnLg3GcbbUexCXPIV6PbSF6q8e5sKubYFAD2UXHmOIt7xi3iUFYhMIeXnvsiSxslRFczDUOmp1gf6et3F9UpM9yP7z8SoH8hR07dIaXl074cuB+X6SyyYKABplUD6Gm1U73XuT+Yc5Lo+9bxAU4PLGzjG0gwCmuJZQcEgWtC91vcpbl/fEF1IjXefDcCsyK4yGWw55g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUlvchscKv8bp8mMTFEtdMcQ+OevaYxiMZnd2qFBc5s=;
 b=HYXzfOz76HJnJshWH/+sTwlRXK/J9mVqf+ZO4QmBMDqG0A9Ua2/w/Q9tfdpzIbr+2bp8tUfxy40iinW09CDpcg3DMsohY9uHLhJ3dJpSneNntELuSqlwTOmVkvLd2FlXIslDqpZyy5M80xJD93SadsH2IROZ+wIrk/4nELmCMM/HE+jk/9qBK2AvKfS2XkQFtCS6/tunkU2TkGJpq2CazGiUTR3ZzybPHVqvIphiXPTtIbgheQtpr9/dPqV5twKGkHrgIAR5zoFjg0g3zo4FonGfKfxcSrrOwHC7v58tD71bylsLaCtF5jPXCLGPT185wu3YhJy+krQgFn7nnf360A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUlvchscKv8bp8mMTFEtdMcQ+OevaYxiMZnd2qFBc5s=;
 b=rHrYg7m8MQHVnrpOPEZcRYYcoDipLdzltxTw2UplG+OgU0pOAKHxjW4GpHBy2IrRnMiGc8sDIwWPF1W/WKwwaL4BOj8DPImdY5KS2z/OrW9Gza3adjor504L7Ok/3bDFibaEJX5mkc5TNUiPCzrbhEmFtTQZifnfT26nz+DdlU8=
Received: from BN6PR06MB2532.namprd06.prod.outlook.com (2603:10b6:404:2a::10)
 by BN7PR06MB6385.namprd06.prod.outlook.com (2603:10b6:408:35::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 20:50:53 +0000
Received: from BN6PR06MB2532.namprd06.prod.outlook.com
 ([fe80::e802:ad07:3832:e440]) by BN6PR06MB2532.namprd06.prod.outlook.com
 ([fe80::e802:ad07:3832:e440%11]) with mapi id 15.20.3109.023; Fri, 19 Jun
 2020 20:50:53 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     Greg KH <gregkh@linuxfoundation.org>,
        Changming Liu <charley.ashbringer@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "thomas@winischhofer.net" <thomas@winischhofer.net>
Subject: RE: [PATCH 0/4] USB: sisusbvga: series of changes char to u8
Thread-Topic: [PATCH 0/4] USB: sisusbvga: series of changes char to u8
Thread-Index: AQHWRdCustgJgFU8iUioGtmJ1I0CNqjfgx2AgADXahA=
Date:   Fri, 19 Jun 2020 20:50:52 +0000
Message-ID: <BN6PR06MB2532B0A36A0C4781BEBB4387E5980@BN6PR06MB2532.namprd06.prod.outlook.com>
References: <1592526534-1739-1-git-send-email-liu.changm@northeastern.edu>
 <20200619070053.GA543232@kroah.com>
In-Reply-To: <20200619070053.GA543232@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=northeastern.edu;
x-originating-ip: [155.33.134.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3182115-ee6b-475c-6be5-08d8149274df
x-ms-traffictypediagnostic: BN7PR06MB6385:
x-microsoft-antispam-prvs: <BN7PR06MB6385BBF4F644B589B5D617FEE5980@BN7PR06MB6385.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0439571D1D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C8TebPwvJ7WSf18hoi0DRtHOkEBRWrK9c6TNl7lMHl13/ktfoGukX0xEwCRtktf7X1KrXQLYXEtV7OTN6dQaGBSyoIoovNxKpAFn+3svIUnQPgJ0DDIbL8vPcEqBndW+DsGZ0gqI12HrQI+OT4+b3S9+rjOQFPTUUL8/ckv74B2jqjrd9F5pUNvgepz9QBLoQv0XSV0RwVgNZaUJSfnBW2gaseTelYoswM9th8yEvPvLKPeky8SaNBr4ynAOxrybpbu9a/IlBdYoKtUgjdY5PFVXqnIri4yv4KXd0qnaUwi8poGpsU9cejI1JCTakdAMmF6oKnjlzQhg7dP+0Gm7kOPZemDjws1fNtlcMt/jFbwOjKUWzNcK/uXKnCi1OSA0pay1lOBVbzPixKllui1EsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR06MB2532.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(396003)(39860400002)(376002)(346002)(366004)(8676002)(4326008)(2906002)(71200400001)(33656002)(55016002)(186003)(26005)(966005)(54906003)(8936002)(5660300002)(66946007)(110136005)(478600001)(9686003)(83380400001)(7696005)(76116006)(75432002)(52536014)(66446008)(786003)(316002)(86362001)(66476007)(6506007)(66556008)(64756008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: khKuyqqOoNHydIemoE7HOtNBdQiGIdzqkvIdFExMU/gPeRjZ1oiEFlEwzL5yu8l3YFV2QRUTx4dpsT+BgQn1N77wzJ3G1jVswGkKM8TH7Re0PR4mYUexTXsDGaOzVswT2oxG0IDIHyoZNl0QZN38KEomS8n9LGCk1yxUW3nS71w5kJpqiji7MI2oezz6DFTtzeD6SdzLAtTqOwzjX4JfGW6Wie9i9Haqe5O6bc18xxzpMJJOW7sb/xkb01EHV0jXaSsz9STxjviHgsogXAs2BgMw1Bui/uT5ntOyHkxOmxVH47U5MDKkvAoJ6AV1WIl5xQuEUeU0BEKisTUfS4dMQYAgXn2nQja3NKwqTocUA4tquzdYp6JC3halu3PET9XMyIc6HFPpbDLEhpznG/IU7FZ+PafQhXDg7iXdAgjti3dDNddfxbaltNiE85gHI/UKoPhoUKNIWi0OvutiOwzHWW0D9Y6fWlILLOIlgwNq+3w=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: c3182115-ee6b-475c-6be5-08d8149274df
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2020 20:50:52.8436
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJNuAnJHpkfKGaEMTaukBoGOI41haXPip75sPecbJy03TR7UG3+7VMGTDbkTcnbfGSWOG6N89jLqH0Ozd3IsytGcciLblLh8kYiF1u4SiiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR06MB6385
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > This patch series changes all appropriate instances of signed char
> > arrays or buffer to unsigned char.
> >
> > For each patch, if changing one variable to u8 involves its
> > callers/callees, then those changes are included in that patch as
> > well.
> >
> > This doesn't apply to ioctl functions, since the types for buffer of
> > ioctl-like functions needs to be char* instead of u8* to keep the
> > compiler happy.
>=20
> Why is that?  What is forcing those types to be that way?  These are all =
self-
> contained in the driver itself, so they should be able to be changed, rig=
ht?
>=20
> Do you have an example of a function that you want to change but somehow
> can not?
>=20
Sorry for this confusion, I should have put more context into this patch.
This is a re-send of a former patch which was rejected by kernel build
test robot when I tried to change all char instances of this driver to
u8 in order to remove any potential undefined behaviors.

This patch(also the former rejected one) were based on a former discussion
with you, the email was quite lengthy, so I attached the link here for=20
your reference. https://www.spinics.net/lists/linux-usb/msg196153.html

In conclusion, only the one I noted in the link has security implication=20
and should be fixed, the other changes from char to u8 are just=20
"in case".

If you still think it's needed to change all instances=20
of char in this driver to u8, I'll enrich the patch note(which I should=20
have done earlier) and re-send the patch series again.
Or if you think just fixing that specific UB in sisusb_write_mem_bulk
is enough, I'll submit another patch.

Sorry again for this lost of context and the inconvenience.
Best,
Changming
