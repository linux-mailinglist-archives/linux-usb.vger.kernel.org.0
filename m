Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC03B6A5617
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 10:45:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbjB1Jp1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 04:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231400AbjB1JpU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 04:45:20 -0500
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2144.outbound.protection.outlook.com [40.92.62.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A40E3598
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 01:44:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krfu8VsrYXfoDkc320lTKhT+wthfLBBip991JQZz2ynrks8ISZB071YO5/3pvLOR1HHuShCCR8FUf5t6g1GyvjlDv9IZcpoRmNeEntp/NHqcb3u4J14YbkuYl1WQgJpwSPQNG5GenUkAsWVo3Ccxbv6aQ7HAR8l8hqrCRJZDBeXPsIz0o/6I5x4GDaVIoT29YCvmJjK1QZto2mcAWmNU9JXNuy/aDu7GhVGqdByAGgwKojb0i3061f/CLOFFFtQS4Mb3IMVxGiTr3P+5YRzDJNHu3dWP9zadlO1HlC0aVkhznNfAcI1MAzEGn5BpqtkyVxQkKkrjpgtQlH6QggbchA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7BRO0nVAvn3uWvbKuCLPmpCnAmVBHCp4smsdy26U80=;
 b=YB2Ct3FVO6Yz8+GqkymJT4DEimZOm4TXI+T3c4k6xWNiBV/JuUgLYiqoqu1PU/PvhWI25IGGYYjtkHTYzCq2z2sZXMYSQpm6j645pnJzZGmEqA/Zc1fMML2kT1KTCd7oxplhkGPXn4UJ+frxZCOfVtBBO69BDnx8W3GsxTmzYSk9RMJ6vIhulm1OwXPUPQbFndZt1HSGdFtC8LctY9OZXcTmnlD0n5wWdEJYOx2qaD+QXjLQCYXrZ4314V4EDcstHowdmXaSatasCj3SlpYTMPnieJURqNc1u858vfB1st1lfJsyX48jSuCGCYEc0d3ko7YZGYVkOVEhwZwYHbTMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7BRO0nVAvn3uWvbKuCLPmpCnAmVBHCp4smsdy26U80=;
 b=ZEEbeoHVo5t2Y/5ZbctsjDPZ+dx1O8bUl3LMI+YVqXvoifHF5Nycl85UeovRATPuXys3OePL5GiVieLRwDI2433nag6Z0IJ1DYjoTRh79y0SQIZMhFFa53msVycsFnhcvVnkzeWKSMD3bjLctBpzk3sQh3QFA+U0TmMAD8CjzIO/qpT/qKHQEgGQq/qJY34aFFfgPPNs/MJZPleL7VpAAMbp1zT81F+C2i/ZU3QEw3MeGix+J+kWT8fdCTtNrsBPWA0ouebJWNii9eZFO/vlo3U+mboN1flGR+tTu7vGjE6NxAZf/YqtQ9YE2OI+FCWuFhfKAa8TsT0T7bbCwD0l1Q==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by ME3P282MB0884.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 09:44:44 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::50ae:cb9:fc65:57f4]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::50ae:cb9:fc65:57f4%5]) with mapi id 15.20.6134.029; Tue, 28 Feb 2023
 09:44:43 +0000
From:   Yen ChunChao <nothingstopsme@hotmail.com>
To:     "davem@davemloft.net" <davem@davemloft.net>
CC:     "pabeni@redhat.com" <pabeni@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH 1/3 RFC] net: usb: ax88179_178a: Enable FLAG_MULTI_PACKET to
 improve tx stability
Thread-Topic: [PATCH 1/3 RFC] net: usb: ax88179_178a: Enable FLAG_MULTI_PACKET
 to improve tx stability
Thread-Index: AQHZS1YYZO9r/AsJ1kCdaKk5CvPGF67kFoTF
Date:   Tue, 28 Feb 2023 09:44:43 +0000
Message-ID: <ME3P282MB2827F38828DB53102F370FA0D1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB2827A82474F353487FF91CE4D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB2827E9AD698A7F925EB1E9BAD1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <ME3P282MB2827E9AD698A7F925EB1E9BAD1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [ckyQfNv0gsCn9cgB7j5+IYFNm3VVIHa+]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB2827:EE_|ME3P282MB0884:EE_
x-ms-office365-filtering-correlation-id: ccc25437-e969-4dc6-3805-08db19706bbf
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y9Lg+x+vbkHhjk75m1dlvGY/Nk9tKyrd6+3LpKxr+z+hl79CvhEZiy0gR3Ujb+22BLf9nWO+Xo/5hKInowul0pYFDKJUQyoK6PYlipEvfvDFCdIRaxn7VkDXeYDvect+CtBrAv5O5hEN7mbcWFdF0nbPK7Equ2IdNL8be8MJYcOIsihBkJ9HpiNbx/72+WIU5LXOfQ026mS6YDzD0qanmy1AMFdUfGJEpMV2dHKQEPDoCHRax8eMRAoMTqY6IZOGxer7OFDeC4kFryCIOHMD4FCS0azgm3KTPJiWmoazBDcL5JW/A+qd/6ButQ7AWoOrNG0RBTCoX9AYDcZ6Hy9k7uvPtudOdX7iRhq8f1nWNs6kMKukDVqmrPuGnmZtNZtwDftyfNOgA5CPon4xPKwrBbh50rD+T8kqjMLK1X5MivBqAM/ne5az5SO8xkZIjnM5XQfviaKApCw72cfTo531lT14wTTf/HMciVmB0HL01FPDjCRBeBD+JQn6d5cBN0ncBMeVxY84RZKhOs5Ej2c7uF7h8F3yN6elSGYgD5/WkDLw06dBdR6ouRO+hgSJj/gbY6DxjokBFXKu04V0kR9kjQ==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DII/GhJ6GrrTWQ9yG2FLqnZWceqSJ4SREgGcZB+VzCztLoSfsPlcjZXjbA?=
 =?iso-8859-1?Q?4FJZ388/Ly0A3Jsrk+YKr/krTBhhJ1hcwGx8Ta8pFBBQ1SDGV0zu0Bvu77?=
 =?iso-8859-1?Q?Q8ssxnmZM2MaTImsydjhbkdvEyTeGqXGobW9FjJpu3kp4ja7UeZhk5l1x9?=
 =?iso-8859-1?Q?C+gnJosuPI/EZv89doypRG5WE9/kUzBrUE4GCs480cTDSFnYUNIP9cYHr6?=
 =?iso-8859-1?Q?Vn+iGLfTNsBusolOuNq1fUKiCFxIuPHvvVKmwEWnBFaDH/zsGEkABRwSTJ?=
 =?iso-8859-1?Q?Rig7vl/gb4WFvKGMUgH4goMwzBBsaX24dQ7k0nI3sFS+osA0e0BYh5onxA?=
 =?iso-8859-1?Q?DCh5/Pgk8wQUCKullemgfJGPYe+rM1qySmgGMKTKiEqDRgDZVqU49PsgGA?=
 =?iso-8859-1?Q?/q1VdDqjgsWQWQnt/B5SlWcGoTXSpxT8pTVOvLo6qngOEt7effWut1QFIZ?=
 =?iso-8859-1?Q?+1YitFuBJ9vak+5C2ux6OkehxzT1ADfZZ9V1ujdggCUJ41k9ORQ5iTwgB4?=
 =?iso-8859-1?Q?tgaLIVehaBKjU4tx0fE09TTpEkR/9M9rSUdbdScoDvjngP+D6LznVNKmYs?=
 =?iso-8859-1?Q?HCrpv9+4h8kWpH8JAP/jzwxwOxOKRZt5Dixn3AU5wnfsJusrB1xirUbWl3?=
 =?iso-8859-1?Q?owbPLIoq1szPIpyKAUtkbYdiO/1Z/ooUVUcFVL3kugu1EdyfQODvM3JJ5u?=
 =?iso-8859-1?Q?T5uHzZXhNi/Hzs8w4TtfcoGwBZK1b/EEPXAuM6MQbyNLz4n2OzOb40cN5I?=
 =?iso-8859-1?Q?qvrg7CRl3JJ4hNfaPpE51WwGSO4tIyHsXkR3MVpmw659m+xwu3/MbbI+1r?=
 =?iso-8859-1?Q?+R/ABa0gU2HNuINUiSV5bfTwBIIhUnDZ+cY/ZcAQ5wbH+ss1sQ9Z/SyzdI?=
 =?iso-8859-1?Q?Jl/F0lS1abb+75W4NIn6k9kVSHyFqATT7+9a1QnfdYEtNG+odqwIV2wMpm?=
 =?iso-8859-1?Q?/YmndCHUYWnKGqgU4uFCX8+Ew/fxmFyvbLGbhuzNtUqTvjXPQIFrzvowYa?=
 =?iso-8859-1?Q?+UG9MpPVTDuUEF+S0/ZpImaWQMuXi3fMkwoOR7m1caHe3ERvHLCwon6dZO?=
 =?iso-8859-1?Q?lLlX9yLdzObtgxnBQ+/9GLMhrz0taNAKz0hT7Kmqgnh6tyCkB6ecD9xMIV?=
 =?iso-8859-1?Q?62PK3w7aVWWtS7wLbJzo201Puxdm9BK3CqxI0NOHOTJodsIsuS435clLAK?=
 =?iso-8859-1?Q?bpQcjSjTKraydNuCNCSi2YjfcV/3gudicaZhIR1FdOxpzcHV+RVkh3z28V?=
 =?iso-8859-1?Q?np1iPc5HQOw/YrWpCA0nPzGYGXasHl7S9260aKzIR7VbHJj5ZxYln8vBPI?=
 =?iso-8859-1?Q?1iLxcv0VojcTadPpxSImB+cnOA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc25437-e969-4dc6-3805-08db19706bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 09:44:43.7625
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB0884
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Problem Description:=0A=
The current way of handling the boundary case in tx, i.e. adding one-byte=
=0A=
padding when the size of an outbound packet is a multiple of the maximum=0A=
frame size used for USB bulk transfer, does not work with the hardware.=0A=
This can be shown by running a loading test via iperf with this hardware as=
=0A=
the sender; one can then tune the iperf parameters on the sender side (e.g.=
=0A=
"-M 510" in my testing environment) so that sent packets frequently hit the=
=0A=
boundary condition, and observe a significant drop in the transmission=0A=
rate. In the worst case (often after a long run), the hardware can stop=0A=
functioning (can not send or receive packets anymore, albeit the=0A=
corresponding network interface is still reported present by ifconfig).=0A=
=0A=
It is also believed that this problem is highly relevant to this bug [1].=
=0A=
=0A=
Solution:=0A=
Enable FLAG_MULTI_PACKET and modify both ax88179_rx_fixup() and=0A=
ax88179_tx_fixup() accordingly.=0A=
=0A=
Rationale:=0A=
When FLAG_MULTI_PACKET is enabled (and FLAG_SEND_ZLP is off, which is the=
=0A=
case for this driver), usbnet will skip padding, and trust that each=0A=
sk_buff returned from the mini-driver's tx_fixup function has been taken=0A=
care of to cater for the requirement of its target hardware. That=0A=
mechanism allows this mini-driver to send, even when the boundary condition=
=0A=
is detected, "untampered" packets (no padding, no extra flags, as if in the=
=0A=
normal case) that the hardware accepts, and therefore resolves this=0A=
problem.=0A=
=0A=
Note that rather than being viewed as a workaround, enabling=0A=
FLAG_MULTI_PACKET is intended to better match the overall behaviour of the=
=0A=
hardware, as it also echos well the rx procedure conducting multiple-packet=
=0A=
extraction from a single sk_buff in ax88179_rx_fixup().=0A=
=0A=
Verification:=0A=
Only tested with this device:=0A=
0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet=0A=
=0A=
References:=0A=
[1] https://bugzilla.kernel.org/show_bug.cgi?id=3D212731=0A=
=0A=
Signed-off-by: Chun-Chao Yen <nothingstopsme@hotmail.com>=0A=
---=0A=
This is the same patch as https://rb.gy/199s5m sent in Oct. 2022.=0A=
I just would like to know the current state of this patch.=0A=
Has it been rejected or still under review?=0A=
=0A=
Thanks=0A=
=0A=
=A0drivers/net/usb/ax88179_178a.c | 62 ++++++++++++++--------------------=
=0A=
=A01 file changed, 26 insertions(+), 36 deletions(-)=0A=
=0A=
diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.=
c=0A=
index aff39bf3161d..b50748b3776c 100644=0A=
--- a/drivers/net/usb/ax88179_178a.c=0A=
+++ b/drivers/net/usb/ax88179_178a.c=0A=
@@ -1426,58 +1426,48 @@ static int ax88179_rx_fixup(struct usbnet *dev, str=
uct sk_buff *skb)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ((*pkt_hdr & (AX_RXHDR_=
CRC_ERR | AX_RXHDR_DROP_ERR)) ||=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pkt_len < 2 + =
ETH_HLEN) {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 de=
v->net->stats.rx_errors++;=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_pul=
l(skb, pkt_len_plus_padd);=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 continu=
e;=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
-=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* last packet */=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (pkt_len_plus_padd =3D=3D sk=
b->len) {=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_tri=
m(skb, pkt_len);=0A=
-=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Skip=
 IP alignment pseudo header */=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_pul=
l(skb, 2);=0A=
-=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb->tr=
uesize =3D SKB_TRUESIZE(pkt_len_plus_padd);=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ax88179=
_rx_checksum(skb, pkt_hdr);=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return =
1;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto ad=
vance_data_ptr;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ax_skb =3D skb_clone(skb, =
GFP_ATOMIC);=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!ax_skb)=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return =
0;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (!ax_skb) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Repo=
rt a packet droped, and continue parsing the rest=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev->ne=
t->stats.rx_dropped++;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto ad=
vance_data_ptr;=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_trim(ax_skb, pkt_len);=
=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Skip IP alignment pseud=
o header */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_pull(ax_skb, 2);=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb->truesize =3D pkt_len_plus_=
padd +=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 SKB_DATA_ALIGN(sizeof(struct sk_buff));=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ax_skb->truesize =3D SKB_TRUESI=
ZE(pkt_len);=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ax88179_rx_checksum(ax_skb=
, pkt_hdr);=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 usbnet_skb_return(dev, ax_=
skb);=0A=
=A0=0A=
+advance_data_ptr:=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_pull(skb, pkt_len_plus=
_padd);=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0 return 0;=0A=
+=A0=A0=A0=A0=A0=A0 return 1;=0A=
=A0}=0A=
=A0=0A=
=A0static struct sk_buff *=0A=
=A0ax88179_tx_fixup(struct usbnet *dev, struct sk_buff *skb, gfp_t flags)=
=0A=
=A0{=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 u32 tx_hdr1, tx_hdr2;=0A=
-=A0=A0=A0=A0=A0=A0 int frame_size =3D dev->maxpacket;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 int headroom;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 void *ptr;=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 tx_hdr1 =3D skb->len;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 tx_hdr2 =3D skb_shinfo(skb)->gso_size; /* Set TSO =
mss */=0A=
-=A0=A0=A0=A0=A0=A0 if (((skb->len + 8) % frame_size) =3D=3D 0)=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tx_hdr2 |=3D 0x80008000;=A0 /* =
Enable padding */=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 headroom =3D skb_headroom(skb) - 8;=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0 if ((dev->net->features & NETIF_F_SG) && skb_linearize(=
skb))=0A=
+=A0=A0=A0=A0=A0=A0 if ((dev->net->features & NETIF_F_SG) && skb_linearize(=
skb)) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_kfree_skb_any(skb);=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 return NULL;=0A=
+=A0=A0=A0=A0=A0=A0 }=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if ((skb_header_cloned(skb) || headroom < 0) &&=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pskb_expand_head(skb, headroom < 0 ? 8=
 : 0, 0, GFP_ATOMIC)) {=0A=
@@ -1680,7 +1670,7 @@ static const struct driver_info ax88179_info =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PA=
CKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1693,7 +1683,7 @@ static const struct driver_info ax88178a_info =3D {=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PA=
CKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1706,7 +1696,7 @@ static const struct driver_info cypress_GX3_info =3D =
{=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PA=
CKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1719,7 +1709,7 @@ static const struct driver_info dlink_dub1312_info =
=3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PA=
CKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1732,7 +1722,7 @@ static const struct driver_info sitecom_info =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PA=
CKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1745,7 +1735,7 @@ static const struct driver_info samsung_info =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PA=
CKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1758,7 +1748,7 @@ static const struct driver_info lenovo_info =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI_PA=
CKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1771,7 +1761,7 @@ static const struct driver_info belkin_info =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset=A0 =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop=A0=A0 =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI=
_PACKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1784,7 +1774,7 @@ static const struct driver_info toshiba_info =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset=A0 =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI=
_PACKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1797,7 +1787,7 @@ static const struct driver_info mct_info =3D {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset=A0 =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop=A0=A0 =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI=
_PACKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1810,7 +1800,7 @@ static const struct driver_info at_umc2000_info =3D {=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset=A0 =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop=A0=A0 =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI=
_PACKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1823,7 +1813,7 @@ static const struct driver_info at_umc200_info =3D {=
=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset=A0 =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop=A0=A0 =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI=
_PACKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
@@ -1836,7 +1826,7 @@ static const struct driver_info at_umc2000sp_info =3D=
 {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .link_reset =3D ax88179_link_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .reset=A0 =3D ax88179_reset,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .stop=A0=A0 =3D ax88179_stop,=0A=
-=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX,=0A=
+=A0=A0=A0=A0=A0=A0 .flags=A0 =3D FLAG_ETHER | FLAG_FRAMING_AX | FLAG_MULTI=
_PACKET,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .rx_fixup =3D ax88179_rx_fixup,=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 .tx_fixup =3D ax88179_tx_fixup,=0A=
=A0};=0A=
-- =0A=
2.32.0=
