Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930726A5618
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 10:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjB1Jpq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 04:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjB1Jpp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 04:45:45 -0500
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2144.outbound.protection.outlook.com [40.92.62.144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28C6D2E0EC
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 01:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz0DC4JwFUnYKWSyn2sgo3qJycdM3g9qgK60ZPRIzpHVf3k5SeFbxUaZWIqSuiRyzl1lhNB66jer9Y4HNFc5lqsE6FoJ8cH5JYvssh5fqkfY1zPNvpmzc4veICbsuTUX1QdYNj+K9adFzyFp8aqe3qOwIw1czSZdwQDetqx4VYYLQAmmafkTJCzU3ATptA7w6xTzVZZenEiZdSFds5nuo8l7iJze+YMaZ/J6e+RvzyPruHQv6nP/AQ0OCdQzRInwuhTlm3oLtI8wCrkhYhWe3pdHN2RzOz+YDc9bZZP6o2y77eYSMF1ttYsRphITBirCo9kCTkS0LvkEAiKRQxShxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vUeMcUDi3HeH9B8x3lZjXb2MttUodq7rT2sTfNw6a4s=;
 b=gOZ+upcVbkO+eMFh1lSmw03aI4M6Msjv6Ini05CEpvOAqodOhjA6Ipv2lWNhJ3HjvFJZmIhUykXGWSIewBAkFsZWbMc1ijQLFjDlFAePASLu4zzKQQVduB15DW+zA84+MpvowKt1YiT+I1OEOa39nxc7WmVnaJfzvNY+fKq+lMU2Va8G1MWu0WMdJfUc1Rndt1SZZSOtvXrCq36CoN9s6pZiRqLCk5bh7XgqULczjUU3UdIUa3zpZz1F/gw4p+IFvcsR0YtjQGLcLwsxuuOQ9i9fp8hemn0/TCPDKOcR4d7ZS+Xk7wzOOTJMOB4s/n8b/lhbp7Vv+f6KD8cYSr6WCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vUeMcUDi3HeH9B8x3lZjXb2MttUodq7rT2sTfNw6a4s=;
 b=OPMCMzyNdC1bPhcKdISSiU/6QTm8JdKTaxMiR+4XmHmD13DNVAr9Jk/XaI2S0TDXiSxe+i+5mcntJurzvTodI+ZUqsW8lULLdoPuXrbNmsiWnGwr0BOevalH92BpB/IwhRfmDMj+wXNSnXLcfoqd1TEn1LrE+HAuMXU2q0pech0mJSfMfpUJiPQjI0le/bzoSxB+elbrUkcRLukkyG5Cs4wB+j+ikoV0nW4LpMaTmKhKQyb4yWhsLP+NdiTZGNbttlciPWwNofb6vwExMQxWnpluMUK9Xgxk04+n0wTgX8P4k8MBHEJzZ4S/RIbyh3w6xjlWBN4ZzMJFk/tg0W9nqw==
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:13c::13)
 by ME3P282MB0884.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:86::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 09:44:52 +0000
Received: from ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::50ae:cb9:fc65:57f4]) by ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
 ([fe80::50ae:cb9:fc65:57f4%5]) with mapi id 15.20.6134.029; Tue, 28 Feb 2023
 09:44:52 +0000
From:   Yen ChunChao <nothingstopsme@hotmail.com>
To:     "davem@davemloft.net" <davem@davemloft.net>
CC:     "pabeni@redhat.com" <pabeni@redhat.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [PATCH 2/3 RFC] net: usb: ax88179_178a: Enable AX_RX_CTL_IPE only
 when NET_IP_ALIGN != 0
Thread-Topic: [PATCH 2/3 RFC] net: usb: ax88179_178a: Enable AX_RX_CTL_IPE
 only when NET_IP_ALIGN != 0
Thread-Index: AQHZS1lO02yRow6F0ES3ZlBD2LvbCA==
Date:   Tue, 28 Feb 2023 09:44:52 +0000
Message-ID: <ME3P282MB282738C1E661EFD33E4EBE1AD1AC9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
References: <20221007142038.2814378-1-nothingstopsme@hotmail.com>
 <ME3P282MB28277442045ADF8086275001D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
In-Reply-To: <ME3P282MB28277442045ADF8086275001D15F9@ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [sbTylhdqrwOqq3p9u8F6El1gcMUD5LPj]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB2827:EE_|ME3P282MB0884:EE_
x-ms-office365-filtering-correlation-id: 4aedc242-9e1d-4d4b-b7ef-08db197070b3
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BUoxWYaIEWD1izyRXH1qmiCJl3vrrZoOcUhlBOFQ6wc4ZuC7vGzW4WZ+gxDMwhE2/cVhVcih4lRqGp53YBmYzKqckbJT2aosiQZ8mrUhzIvuJRaAJkW7HkegRyRPLfuNJGnUSi7sg0W2kS8/P1CexQIa3tN6vTKDcBdXXclPnqChmHeCUHhsPyCkuMghi7tF4YoZ3ymI0Az+bws/dYFGdLyW1OHXVXS8NYUoJqXyPXxBH45H0YqrzGbVqMqLmoqkn0o74HEpMngjMC5678JYF+6rrL5Wj9SoqzPSJ2wKbVzJWOSfaVj0KaknUhgZcEfPZZgUPIQq6azzyzbdsdg7D4K9soJGGSobLQXgrOe2f2XdncxqbqmY3njMgxBoxUeW3ik6npiKxCncgpwZ16MRWXpODHy3st5XHLe9WRzBz8Goafx7L42FwoLu8aGRj9nlFcAq/pZxo8mxMVKdGHj6ga8EDG8VJNrqrRAC3yLSL8UoK69DKnUThnnyMWUxtkIHxWdFZRZbi5DSbZ2dhq463534ybjzFB4BrZcL48DiApz/bzBAtcMTVS4No0QNjCeoZTQbYLkZpduMg84jA0zVwg==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8AlOEVoofYvuHjtQodoWGQJ4dT/Wac3jVMrFXQJc0B6sli3jzhafVtPEoE?=
 =?iso-8859-1?Q?ncw06G5H+AnJQ4UJySSNeV0U6Gh+4ubXkepP9vdwwmrqmV6ZRq1Thc+GUv?=
 =?iso-8859-1?Q?Ue5kJSZQvI7MbL4FvKd0S4FuxRjX+tXBQilQmfVb9gXbyzZAz1Ni23um3I?=
 =?iso-8859-1?Q?iqdzEPMmjtVThyDnq6qdH2AB2ST1xjbX6qj2zT76vJmSmmuXvKXH60zMIl?=
 =?iso-8859-1?Q?mXpTAIOkch6KSczJkFY9qyQ+kXw0RaWOKGBZ02Bn0vUUY2z36G0oHGQzmD?=
 =?iso-8859-1?Q?zda1QajTFxWYDqGRGd9VYnIcstgxjKS3lKRI1R3hgcdjTOMRrjeETTSc6m?=
 =?iso-8859-1?Q?tFwV6V3ScqAIICutFzRj28ZQp/EbnLWZq3/CbabAMR7dReaQcVs02ydG1Q?=
 =?iso-8859-1?Q?MGrhllT2x7FGVpBp/Oym/LTe7OT2DS5CfOmBzFnAuanfNfQF/+TS2nPRcL?=
 =?iso-8859-1?Q?o4iBHGfRl0QXif2pdsxmU0EgVIcTzhzdJNi0eAvtmFUJwoONYhUnpiBogR?=
 =?iso-8859-1?Q?WnQfzOf4cVXoS/mJQ3U0mmQnSn93wFhFcXEwAjFGUKjW9pfitn71ymojK3?=
 =?iso-8859-1?Q?V8144HGOpVX/NqFYi8uapkC8z4/2nSh/y+qdhxa/mKlY8gOJIrqqg5CSDR?=
 =?iso-8859-1?Q?XA6wp+owlap5032dEkqo2RMQNjIl1xiJIiRfTKhZy5O/HxGq8NCnf3Wd9Z?=
 =?iso-8859-1?Q?3gP4yzLtAQu7ypijKqtU92E7s7lMsU2BuYdm5KGpsSCuoo+kX29Ah4zBnU?=
 =?iso-8859-1?Q?OXbLJmfeVg27s1nJa7invBdt7uuCDBZ3FvvV8B07PXN0tLte1S7YFVYvFR?=
 =?iso-8859-1?Q?IVJEzyO+QdhiBBJPwWj7VhxQg6ifRERL4Rh9YnkFWnoLIVUWpieHJEhgGZ?=
 =?iso-8859-1?Q?aBAt5OmLt+pg3b+02K8zcSG0IBdCzQizlJ+miMiHcgBFzyyTGw96/yAgO2?=
 =?iso-8859-1?Q?0d/Op3H6KrCRrUnloGRNFrNJCQCS2p4XqsuzOSksbRAnrwpuFxBJKzymi3?=
 =?iso-8859-1?Q?Ym42BBbsimfAXGrgiXd0FUyQJMe2dpgI65Q74abts7cavhn6xCb6mPsvRw?=
 =?iso-8859-1?Q?9bw01dl/XflRTUEAG+9nj/yv6JU5idMpyOd43/LOhNkn61FBA8v+YPICwA?=
 =?iso-8859-1?Q?TSSR0uebKDM3rCbm60K6oAl6NZe944HjQAcv+ySap4fxXPlVU3/eVcYZ65?=
 =?iso-8859-1?Q?FUOEly3N1SOMxU+qPIjn/etwjD64WxZuC+xgTMf0Tqx0F9IwLjiDvNDGsQ?=
 =?iso-8859-1?Q?JKEuSAqKapHFmzwTlkyEVNx1q8SgBZZBYg4Ch8BwBLtWWNqqi37gDZ9wXu?=
 =?iso-8859-1?Q?ATeBF346muZSJJs4nT+TNp314w=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-746f3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2827.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4aedc242-9e1d-4d4b-b7ef-08db197070b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 09:44:52.0758
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
According to the comments in the hardware vendor's outdated source code=0A=
[1], AX_RX_CTL_IPE signals the hardware to do 32-bit(4-byte) IP header=0A=
alignment; such alignment is equivalent to the concept of NET_IP_ALIGN =3D =
2=0A=
(an extra 2-byte "pesudo header" at the beginning of each etherner frame),=
=0A=
as described in skbuff.h.=0A=
=0A=
In the current implementation, however, AX_RX_CTL_IPE is always enabled=0A=
regardless of the value of NET_IP_ALIGN; this can introduce waste in many=
=0A=
aspects, such as=0A=
1. hardware internal resource=0A=
2. USB bandwidth=0A=
3. host memory=0A=
4. cpu cycles (for updating frame start pointers and frame size variables)=
=0A=
when alignment is completely unnecessary, i.e. NET_IP_ALIGN =3D 0.=0A=
=0A=
Solution:=0A=
Enable AX_RX_CTL_IPE and process pesudo headers only when NET_IP_ALIGN !=3D=
=0A=
0.=0A=
=0A=
Verification:=0A=
Only tested on a platform where NET_IP_ALIGN =3D 0, with this device:=0A=
0b95:1790 ASIX Electronics Corp. AX88179 Gigabit Ethernet=0A=
=0A=
References:=0A=
[1] https://www.asix.com.tw/en/support/download/file/120 (AX88179 USB3.0 to=
=0A=
10/100/1000M Gigabit Ethernet Controller, version 1.20.0)=0A=
=0A=
Signed-off-by: Chun-Chao Yen <nothingstopsme@hotmail.com>=0A=
---=0A=
This is the same patch as https://rb.gy/ieil2d sent in Oct. 2022.=0A=
I just would like to know the current state of this patch.=0A=
Has it been rejected or still under review?=0A=
=0A=
Thanks=0A=
=0A=
=A0drivers/net/usb/ax88179_178a.c | 20 +++++++++++++++-----=0A=
=A01 file changed, 15 insertions(+), 5 deletions(-)=0A=
=0A=
diff --git a/drivers/net/usb/ax88179_178a.c b/drivers/net/usb/ax88179_178a.=
c=0A=
index b50748b3776c..96ede3a131d4 100644=0A=
--- a/drivers/net/usb/ax88179_178a.c=0A=
+++ b/drivers/net/usb/ax88179_178a.c=0A=
@@ -858,7 +858,10 @@ static void ax88179_set_multicast(struct net_device *n=
et)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 struct ax88179_data *data =3D dev->driver_priv;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 u8 *m_filter =3D ((u8 *)dev->data);=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0 data->rxctl =3D (AX_RX_CTL_START | AX_RX_CTL_AB | AX_RX=
_CTL_IPE);=0A=
+=A0=A0=A0=A0=A0=A0 data->rxctl =3D (AX_RX_CTL_START | AX_RX_CTL_AB);=0A=
+=0A=
+=A0=A0=A0=A0=A0=A0 if (NET_IP_ALIGN)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 data->rxctl |=3D AX_RX_CTL_IPE;=
=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 if (net->flags & IFF_PROMISC) {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 data->rxctl |=3D AX_RX_CTL=
_PRO;=0A=
@@ -1424,7 +1427,7 @@ static int ax88179_rx_fixup(struct usbnet *dev, struc=
t sk_buff *skb)=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Check CRC or runt packe=
t */=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ((*pkt_hdr & (AX_RXHDR_=
CRC_ERR | AX_RXHDR_DROP_ERR)) ||=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pkt_len < 2 + ETH_H=
LEN) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 pkt_len < (NET_IP_A=
LIGN ? 2 : 0) + ETH_HLEN) {=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 de=
v->net->stats.rx_errors++;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 go=
to advance_data_ptr;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
@@ -1438,8 +1441,13 @@ static int ax88179_rx_fixup(struct usbnet *dev, stru=
ct sk_buff *skb)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_trim(ax_skb, pkt_len);=
=0A=
=A0=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Skip IP alignment pseudo hea=
der */=0A=
-=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_pull(ax_skb, 2);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (NET_IP_ALIGN) {=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /* Skip=
 the pseudo header, 2 bytes at the start of each=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * et=
hernet frame, resulting from hardware 4-byte=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 * IP=
 header alignment (triggered by AX_RX_CTL_IPE)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 */=
=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 skb_pul=
l(ax_skb, 2);=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ax_skb->truesize =3D SKB_T=
RUESIZE(pkt_len);=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ax88179_rx_checksum(ax_skb=
, pkt_hdr);=0A=
@@ -1609,8 +1617,10 @@ static int ax88179_reset(struct usbnet *dev)=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_TXCOE_CTL=
, 1, 1, tmp);=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 /* Configure RX control register =3D> start operat=
ion */=0A=
-=A0=A0=A0=A0=A0=A0 *tmp16 =3D AX_RX_CTL_DROPCRCERR | AX_RX_CTL_IPE | AX_RX=
_CTL_START |=0A=
+=A0=A0=A0=A0=A0=A0 *tmp16 =3D AX_RX_CTL_DROPCRCERR | AX_RX_CTL_START |=0A=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 AX_RX_CTL_AP | AX_RX_CT=
L_AMALL | AX_RX_CTL_AB;=0A=
+=A0=A0=A0=A0=A0=A0 if (NET_IP_ALIGN)=0A=
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 *tmp16 |=3D AX_RX_CTL_IPE;=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 ax88179_write_cmd(dev, AX_ACCESS_MAC, AX_RX_CTL, 2=
, 2, tmp16);=0A=
=A0=0A=
=A0=A0=A0=A0=A0=A0=A0=A0 *tmp =3D AX_MONITOR_MODE_PMETYPE | AX_MONITOR_MODE=
_PMEPOL |=0A=
-- =0A=
2.32.0=0A=
