Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771471D9605
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2020 14:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728647AbgESMO7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 08:14:59 -0400
Received: from mail-co1nam11on2051.outbound.protection.outlook.com ([40.107.220.51]:9376
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726196AbgESMO6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 19 May 2020 08:14:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJDmAHKVdZnJ1e/Mz8n+AvfdciphhcL3kVbyt4PefOuDL94bDSmB/arPF6HNS+I/PIczkWeupOijn+8qkp5owTMZVilKGM0dXiwyDUBB4fF49QAi96Ymr2NWOiOrIHzdMjJCE3y5vXQlxckHFlMnDKyq6PAJnY5iNzzaGiEOY8Uwe0eXChJeAdayCIHmT1fhPpL4r2yXdwSo/rbRReYBtU1GrEel+weBLY8uaB+6Dx/2iKVC7VW+H/FMSA1FCp35mA6NylXO/vJ1UkG5UK9ZILNkDSgh1H3OMb0Mb6H21gRtVzmp/Jxa+HeqH4UMW0v0KaUGDel3lYyD4otgEWdB9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34pbw3zptFo7jY8KhgU7lCKN3f5T8Xc/CW9TvQOOHa0=;
 b=fqy+whgrX8WCHwYaMOwNv/uu6S+aDxZlClhPTuMMew7CRmh1A/i9ASFvY/XtQ0OjJ/I7tEaooziokGUr1h1wepoVB19Jldtv+tey51S+0nz4YmEiuWTnCGKTwXr+V+diibAt0dI3G5jJyr+ow30ZhVG7OZ0W3NW3ork27bXbZKaZynRVJysVSpBjlCEXgvdT3Cy1O+gJXD5l8JUWfpfb3wkFkKfnBW0O2CsSQpn9YriyCG2k1LTmzRmXSVwc+vFpCmij57WWhxq9a7guA6AxZTl8xBboYKZVGI7N58rlk/fFz5IWA0kr5eM66nWWRE9IPSuzK84eDBWrp0tC1k4x7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=34pbw3zptFo7jY8KhgU7lCKN3f5T8Xc/CW9TvQOOHa0=;
 b=NgQhm6b8HDCFENmUqwkDrvdqw1wXaEj+I0A2fOPEo9h/e8OqqJcqV7oZDc8IAlOsJ2fw6BUy6zN5Yazd578uHfGSl5qqk3w/UKVmi+GgAlIMnzXBgigG7SyC85wnlE0es5v2Lo5k5Lsf2D6eZM6X58N89eT+iPkE+Yu7+1oDgWM=
Received: from BN8PR10MB3540.namprd10.prod.outlook.com (2603:10b6:408:ae::24)
 by BN8PR10MB3458.namprd10.prod.outlook.com (2603:10b6:408:bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Tue, 19 May
 2020 12:14:55 +0000
Received: from BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941]) by BN8PR10MB3540.namprd10.prod.outlook.com
 ([fe80::c158:d59f:e3bc:1941%2]) with mapi id 15.20.3000.034; Tue, 19 May 2020
 12:14:55 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: ttyACM strange chars appearing at connect
Thread-Topic: ttyACM strange chars appearing at connect
Thread-Index: AQHWLdcbNaT93COqRkquqTua8R38BQ==
Date:   Tue, 19 May 2020 12:14:55 +0000
Message-ID: <52b8c126634058e3a455dc0ab8b0c542916db543.camel@infinera.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.2 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=infinera.com;
x-originating-ip: [88.131.87.201]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 369176f1-7a15-4ed7-5fbc-08d7fbee3de8
x-ms-traffictypediagnostic: BN8PR10MB3458:
x-microsoft-antispam-prvs: <BN8PR10MB34580E91684D8A1C5BFCA0DDF4B90@BN8PR10MB3458.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 040866B734
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: umTyHxddlhJnIrbaV6OI4NeRLpU/IJfki5vigmzs9h8uXkSbYh98a0+Qi62agSMwaxGo8CLN8TJ16KN00eMNRMlg+gdCFGJ2M050IJm4YePlkqDn8lWnK3WATeJ43u1sWF2t9bBMgYow3KYA8VImfgyLubG8E6HSH+gFtwfUR67RmAci5exLAVPm+vAR/16hYnJ1k2ez8hBmId8EuTD3KJCIiiGJjCairaWkMpJ0AeMq9SjIluMKZ52tQ9vagSofWokP1d6mjA5FjZv9ipXn4Fzir2PSV4INrhD+4R7CQhSSRR8flKGVkZs19uw6odAKwjJhXHfH7w31mSuaRibo0Kf+t6yZbWXu5XhDn+dWSzi5N+st+8WjV6F1QPv1IAP+OvruTMvWTjHbFu2g2hLn8LloPBTwj8NZJ0hvWmUeHZiTG8GJruYpHpUgCmAjQOlf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR10MB3540.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(346002)(376002)(39860400002)(136003)(396003)(478600001)(86362001)(36756003)(6512007)(6486002)(91956017)(76116006)(64756008)(66946007)(186003)(26005)(8676002)(8936002)(66446008)(66556008)(66476007)(6506007)(2616005)(316002)(2906002)(71200400001)(6916009)(4744005)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: tzQm8ivlh9GFAlBBHs2r6U9Qz36Zw3oSwt1ca1q5LvRNA+pb3ILEZ9yZZu+Xfn7XD/ZauD6PBklJ3lM/lJzjQtVb4VjLZT5n0/jgGLsMYBNjPqGVR/uAVhNriiDIsIpymJLXY53YdX9u2RJl2KJu7YNR7pCCwXXLd7fJIB+66WSykVyKM3mqiTOMCFhqzclGF2WK9e7I1IxneTOcWvIsDTpH1cOTkpVVRGue5shB3mXPuli7HLEVC+hLQxwjDECRHLOHXRyvwXjAR/ai6Wtybd/yum2W57Zo68NvgIJBolW0dBc/wO9ZlhlSPkFMyWTGAu2Fdj8Lrh1pfl62TERmmM3JbOyPhFVju6PysVaXyTAi8Ose2vISH8q/vxt03IKx99oJf6Wn7aZr0mamWxq8Zk2YNVhGp6rvFFTDN7dp88nFdPXV8cpq35z7o+2CcPGGjKj66Tv+i/g4liTImCsXEiICXqLu95ErWAvZsJf4Jp4=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C8BA85F15D2384C81216A3F9BF9342F@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 369176f1-7a15-4ed7-5fbc-08d7fbee3de8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2020 12:14:55.3692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IAYDoQI9QXY0pSeRt1Pebma10Gp1tthdrz/CuxT0dI/tGHr5TTV3j3P93r9+77Sa/NH/nmeHlQVuntW383f5zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3458
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

V2hlbmV2ZXIgd2UgY29ubmVjdCBhIExpbnV4IGxhcHRvcCg0LjE5LjExOCkgdG8gb3VyIHR0eUFD
TSBzZXJpYWwgZ2FkZ2V0IHdlIGNhbiBzZWUgc29tIHN0cmFuZ2UNCmNoYXJzIGFwcGVhcmluZyBp
biBvdXIgZ2FkZ2V0Og0KMDPvv71gM++/vTAz77+9eO+/vXgoaW4gaGV4OiAzMDMzIGVmYmYgYmQ2
MCAzM2VmIGJmYmQgMzAzMyBlZmJmIGJkNzggZWZiZiBiZDc4KQ0KVGhleSBhcHBlYXIgd2l0Y2gg
Yy5hIDEgc2VjIGluIGJldHdlZW4uDQpJIGFzc3VtZSBpdCBpcyB0aGUgbGFwdG9wcyBBQ00gZHJp
dmVyIGVtaXR0aW5nIHRob3NlLCBidXQgd2h5PyBDYW4gdGhlc2UgY2hhcnMgYmUgdHVybmVkIG9m
Zj8NCg0KIEpvY2tlDQo=
