Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 110252B4068
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 11:02:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727282AbgKPKC1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 05:02:27 -0500
Received: from mail-am6eur05on2066.outbound.protection.outlook.com ([40.107.22.66]:38753
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726754AbgKPKC0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 05:02:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6LbVl8CwRNzdiOVfCul4773QEVBeHwPMJ5pA/By5rC3gdQ0+EpJQMaizYybGw/ZyBAG5h8A+MoDTDvLlxPkcmx2+wOEy5bmUi6snXqydDJ+4dwaO8QmsRnOi3uy20NzySqZu3682W+keL/DHAgsWCNjifonkBkUVIQiJDMd1d8wjp4ICQ4lgIKb1YuEBgUUwZ0r+1FwB9WVnprgrsA2pmIW0Uq1hbnIa+Je/rGBAouZptSWHXtvaAk/rri5TSU6R6xZfd0rmXSGdkSBjZoYugt1pX9OfZc28WGPUuEgWPYTg06Oer0G0A8pt0seCo3LlB7BiGle6N2qhSqlDo3ntQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN5OCwlKbtnQWUJva8+T9p4IRF6dWjJhljIKecm0KUU=;
 b=aDXS716kpTWLq7KzPC4Ls9WQrqYRz21sjc3ryzC8J/GfkZJb3uYKkNs3d8PK32BB6tI53ic7yNzk4s59eKDiHcvN3UWlBBhZFi7XB0+IdiCcsHPvNeKI1cC6jpSqdSulvKcHiy62hJR1/k6UygipCmNi6AlIuTT6cz3aF7/PIUqkLbN/QSMLA0E9i8LLoK+VB8Cx5gTtWzUiSPUfEzTsobZUJpA02gDdf6N5N5+PTN4NG5+yxsto8X5P+AaIo0d5sTV/+e371zgFEVm4V0thaS/9ciDh8lKScWEw7EKe6pM0+MYxRXB+GEp6cFFM8B0aBdGAfxqygIaUlQEWAzJf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gN5OCwlKbtnQWUJva8+T9p4IRF6dWjJhljIKecm0KUU=;
 b=rtwxvoggsyPXV7x2Txe62honIc+tgW5xrr0MicUNzUd6XP8Q70iGCc+7oJt/Byg8e4gMI3/9QXFWXnh08hQdBAXEkxlUZ0V3Vh03ukEofC4nMnseLpx5zLjow11gzk5tuyvHfphqqaH0Hf1QyT/g/Yh9Gz7PXBzlO/A1bPwUuPQ=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR04MB3016.eurprd04.prod.outlook.com (2603:10a6:6:a::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21; Mon, 16 Nov 2020 10:02:22 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 10:02:22 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     "g@rowland.harvard.edu" <g@rowland.harvard.edu>,
        Kyungtae Kim <kt0755@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        syzkaller <syzkaller@googlegroups.com>
Subject: Re: WARNING in usb_composite_setup_continue
Thread-Topic: WARNING in usb_composite_setup_continue
Thread-Index: AQHWts63EhYqxw4n/06tOdNAYgT+7anBhpYAgAHSrwCAAN22AIAAdOWAgAEus4CAAHS5gIAEQhkA
Date:   Mon, 16 Nov 2020 10:02:22 +0000
Message-ID: <20201116100152.GA28313@b29397-desktop>
References: <CAEAjamsxe9OuMVpHfox3w57HtGsE3mPXOty9bdXW-iPdx=TXMA@mail.gmail.com>
 <CAEAjamsjFXWGSwUcCuUOeJ8s9EWGQP-Jvt40bG0Otav=xFb+5A@mail.gmail.com>
 <20201110155650.GC190146@rowland.harvard.edu>
 <20201111194710.GA245264@rowland.harvard.edu>
 <20201112090042.GA19895@b29397-desktop>
 <20201112155905.GB276702@rowland.harvard.edu>
 <20201113100229.GB21517@b29397-desktop>
 <20201113170015.GD322940@rowland.harvard.edu>
In-Reply-To: <20201113170015.GD322940@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rowland.harvard.edu; dkim=none (message not signed)
 header.d=none;rowland.harvard.edu; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8d2baf78-8f72-499e-27eb-08d88a16b638
x-ms-traffictypediagnostic: DB6PR04MB3016:
x-microsoft-antispam-prvs: <DB6PR04MB3016AEA173679081B18428498BE30@DB6PR04MB3016.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yruSnvHX70pv61bdqGV9Cu7ZIJSC15WAOnjKb23G8PlkNdSormm9Fg1leh8B9pN6LrSrMAE4tvbxkaPZ6kcHbJRAq2jd+/+Iwh9SRm3R8Vz1LOxRDFi7F1dkqVzPahrqHh4MOjWY5knONF9cIWznhAz2nuG7FwbcxyU6c6Ny/dDE185nmOA5qZOv8dx7KSywUOs1BdI66fMdwGXLYF+tlaq+KEQRRIIypB/ygj1Zw+WNJYuouLMCX60LQJ5pN9XToemKnOR3OMD7yHi3YVCD2poQKswOl2Dl6udRV+aXBH9N++qEvNfB2BUrgpRLRwK3Gvl8N2WV752w8ZEMS1xi/A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(376002)(39860400002)(136003)(396003)(346002)(366004)(478600001)(91956017)(316002)(6486002)(6512007)(54906003)(76116006)(66556008)(66476007)(66446008)(8936002)(66946007)(33716001)(86362001)(6506007)(9686003)(53546011)(64756008)(2906002)(6916009)(71200400001)(1076003)(4326008)(8676002)(83380400001)(5660300002)(33656002)(44832011)(186003)(7116003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: OJ4MXMi4na7p4Z4m16EBmh+dOZyVcUH+YwY2TdFzlKJ32kgrWOrRbPt6M27stpNoBbC8YW2+WgcN5cAFDhAB5EylXKsl+VuABDUrsA+BJP9IgoMKi1sXOINBsFKXP9abV++hMUIzWGxSPc7infjJlqP/r0eF8YWrFv2j/lyt5Z3yJt75qxS639MLbo9xhbYT+8VXeV6MqPK8wkf6Kbi7dHLGjZjgcHwrMIWKtAqndM+s/f2jH/9ce+OBsPaacrvOcjKhADIJD2op4DA0V82Ep8XGar3DuRlxkmNpDndiZFQOLEec2QaZD4EI0hteCgaXQlWhDjBO5N1CHJQe91bwy+kQj0HFobNGxIJYQHScb1eNieQJ2oQk6LgiDwKztVKKPRO28lNx/2HO00yyknNv+sBbk2myfw1C43vST6Ca5ueWmV/evg4qCAQk5CWDFlMM99j32x2S//1yakengz5usPDi0y0VPVEzc+FF8OwtT6k98r6+ZQCFICmZ1Gx6FVsDYwDSQ0z9gu/U0fbr7AeMTBZYOXJk8oejY2cQR7dhBJ9jmVyu8yOv2sV+4Op7B6ayBhZbJJJ0RaOwb+0sUAyWUvQiITLdbn1xp14PlSIXwEp1ZT2f+VcjD5QZcaD1vbK9rqT1RCI9EgaaYYjY2RVZ5g==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <52FBC3838B2B7F4E9D32D131747E29FA@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2baf78-8f72-499e-27eb-08d88a16b638
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 10:02:22.3126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+lVBCuJn8Eswk2OvQVuvDANhWtdNncPICMtq27vHPHeDsaZ3+E07hfoK44UwWeJcgBnmhIvr3N0mWadLxZeXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3016
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-13 12:00:15, Alan Stern wrote:
> On Fri, Nov 13, 2020 at 10:02:58AM +0000, Peter Chen wrote:
> > On 20-11-12 10:59:05, Alan Stern wrote:
> > > This is why I think we will need to change the API.  There has to be =
a=20
> > > way to tell usb_composite_setup_continue() which SETUP it is being=20
> > > called for.  A new SETUP or a disconnect should invalidate the old=20
> > > SETUP, and then usb_composite_setup_continue() would ignore any calls=
=20
> > > that were for the old SETUP packet.
> > >=20
> >=20
> > I think usb_composite_setup_continue logic has no issue, we only need t=
o
> > consider if changing WARN to DBG is necessary, FuzzUSB seems to be
> > trigger panic for WARN.
>=20
> Yes, changing the WARN to DBG will make FuzzUSB happy.  But I still=20
> think there is a logical flaw in the design of the API.
>=20
> > See below message on its trace log
> > > Kernel panic - not syncing: panic_on_warn set ...
> >=20
> >=20
> > For new SETUP, current composite layer makes sure the pending request
> > will not get the status since the stage request is only queued when
> > cdev->delayed_status is 1.
> >=20
> > But the UDC driver should make sure no new
> > request if old request has not finished, consider the corner case that
> > the new SETUP comes after the pending request calls usb_composite_setup=
_continue
> > and queues the status stage, then, the two zero-length packets from dev=
ice
> > will be the bus, but host only wants get one. Meanwhile, there is only =
one
> > request for composite device (see: usb_composite_dev.req), it means the
> > composite layer can't handle multiple ep0 request.
>=20
> That's right.  Unfortunately, I think fixing this will require changes=20
> to the UDC drivers as well as to the composite core.  Similar to what I=20
> said earlier, there will have to be a way for the composite core to tell=
=20
> the UDC driver which SETUP packet the zero-length status reply is meant=20
> for.

It needs the composite layer to support multiple requests for EP0, the
effort is big. It is better the real problem is reported, then, it has
environment to test the solution. The reported FuzzUSB issue is not this is=
sue.

>=20
> > For disconnect event, it is an unexpected event between SETUP(DATA) sta=
ge
> > and status stage, and usb_composite_setup_continue just does nothing
> > since the bus has already not at configured state.
>=20
> Yes.  But there still is another problem in the API.
>=20
> Suppose the host sends a Set-Interface request, and the function driver=20
> is not able to handle it (maybe a memory allocation fails).  The gadget=20
> should report this failure to the host by STALLing ep0.  But there is no=
=20
> way for the function driver to tell the composite core that the failure=20
> occurred!
>=20
> You can see this problem in f_mass_storage.c.  If do_set_interface()=20
> encounters an error, it will return a negative error code.  But the=20
> caller (handle_exception()) ignores the return code!
>=20
> When Dave Brownell designed the Gadget and Composite APIs, he really did=
=20
> not give sufficient thought to the issues involved in delayed responses=20
> to control-OUT transfers.
>=20

We could add one parameter for usb_composite_setup_continue to indicate
error occurred during function's deferred operation, and stall the ep0
at usb_composite_setup_continue, do you think so?

--=20

Thanks,
Peter Chen=
