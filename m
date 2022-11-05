Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3092A61D931
	for <lists+linux-usb@lfdr.de>; Sat,  5 Nov 2022 10:46:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbiKEJqe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Nov 2022 05:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiKEJqc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Nov 2022 05:46:32 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F4917E1A
        for <linux-usb@vger.kernel.org>; Sat,  5 Nov 2022 02:46:31 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d20so5915798plr.10
        for <linux-usb@vger.kernel.org>; Sat, 05 Nov 2022 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:autocrypt:cc:content-language:references:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HoCUB1oQUvcPcuzeJRvlUWhpSmMsQo4cd2U1mJrvIyY=;
        b=dbNgXoiXxp/v71wPVnw2YBXgyjfoWkDnPhIzzE+60KreERfoWuK34DFJWBfaXwHoxB
         Hoy+qrBSwmvoi/uZrwknZcN/0rhuHzkWbbif2TqbMcmzGNVQKh7qYFCC7zSl13b/br95
         9AQ/sd76aFNqCstxkJ6JedxbliUsMIvhhnTapRREpkG11Lvq5146/jNkpch130Yl516K
         QwyiyyBRxihMtHnOgrvE8vasXi6PYrLQ9/8V78N7X1rl6BlRUIFKtvwgdwzc2258LouV
         InWY/sWuY1PAiZpc8JsxIp3S2TPT5BCYvG7AWrACE/YXn2JEkDRt2BQSQQEGifiWS+FV
         0ehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:autocrypt:cc:content-language:references:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoCUB1oQUvcPcuzeJRvlUWhpSmMsQo4cd2U1mJrvIyY=;
        b=og2MS477ZPsNVY/lDWoUEZaxEPHHc8mOAOHOr3VY/sQ0WA5nfF+AAguhcqgGkYRpAL
         hDhd69dW4HEOLpNjRpmqgAol4DnLFz/yiH/NcT1x3LgMfdnUwvDzZFrLBKEd3sGwMc8H
         xA2RlztoXkYfxQca41A1YqMGgYe578t8/P2LEcPFzpqX3zwkpj8ZooPJKvfRa+SkPNYo
         oK4N8uck99LfjUgKCq/NUjGAy+BwyAG/nJ5wneJTzsel4rKac6pnfN7Q4D4sXKbwBTbn
         oz7f264JkFTaA6LSzsqEMM8jjTaADNi6c1Qox9NLxU/KA21raWmK+PBgART/7abmm3n8
         LZsg==
X-Gm-Message-State: ACrzQf0RSVBoDxhwKNXHG11L1O1tT2dBE3BZHYIoMpDnvi0dAJj01VB+
        hGj6+UAK7LaqLtSaOqYhXxPImNAPx/M=
X-Google-Smtp-Source: AMsMyM6egHPDZs0xxLagLwaZYzcpFBxUCK9kKn+VfYVvRxBHFjvblQEbMxshh8xT0eT8r/5Fj6EvSw==
X-Received: by 2002:a17:903:494:b0:186:a227:436f with SMTP id jj20-20020a170903049400b00186a227436fmr39796563plb.133.1667641590800;
        Sat, 05 Nov 2022 02:46:30 -0700 (PDT)
Received: from ?IPV6:2405:6e00:492:32d2:bb4:da0c:7dae:af1e? ([2405:6e00:492:32d2:bb4:da0c:7dae:af1e])
        by smtp.gmail.com with ESMTPSA id p67-20020a625b46000000b005625d6d2999sm940451pfb.187.2022.11.05.02.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 02:46:30 -0700 (PDT)
Message-ID: <98df4ca9-082c-ca31-a72a-5fbd62f26d9a@gmail.com>
Date:   Sat, 5 Nov 2022 20:46:25 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
From:   Albert Zhou <albert.zhou.50@gmail.com>
Subject: Re: [PATCH net-next 2/2] Update R8152 module to v2 obtained from the
 Realtek website, included in a comment in r8152.c. The only other
 modification to r8152.c is amending netif_napi_add, see comment for
 explanation.
To:     Greg KH <gregkh@linuxfoundation.org>
References: <20221104132526.64530-1-albert.zhou.50@gmail.com>
 <20221104132526.64530-3-albert.zhou.50@gmail.com>
 <Y2UkZpD+xeShM+jc@kroah.com>
Content-Language: en-AU
Cc:     linux-usb@vger.kernel.org
Autocrypt: addr=albert.zhou.50@gmail.com; keydata=
 xjMEYkX5gxYJKwYBBAHaRw8BAQdAsW8QQjKnmpKC5G1d1QFYNvd9ddMxwYZs+xTT0dyqvtbN
 JkFsYmVydCBaaG91IDxhbGJlcnQuemhvdS41MEBnbWFpbC5jb20+wosEExYIADMWIQRLx2w8
 czp1EBJaieEhj+NExaaGfQUCYkX5gwIbAwULCQgHAgYVCAkKCwIFFgIDAQAACgkQIY/jRMWm
 hn2rKAEAlOVVAsYIpmGTEng+e/HHT7JJjCjcX4lh+pFZdUy2DGgBAM/EwKNYoNB43H5EJpb8
 I68MS+ZZSQ3swJWAu1OJKXIJzjgEYkX5gxIKKwYBBAGXVQEFAQEHQNk/Nf/E1Uttgm29quUB
 Xgc9RDwqKTHbtHLS5SOkZzhUAwEIB8J4BBgWCAAgFiEES8dsPHM6dRASWonhIY/jRMWmhn0F
 AmJF+YMCGwwACgkQIY/jRMWmhn0KRwD7Bv1kWYB2m8c5tRQUg7i3zIaJ4kpfqMj4bwYQ9xEk
 e3oA/11CMCzdPMcoveB279og31mtUISG5mXMDJmiE4y61akN
In-Reply-To: <Y2UkZpD+xeShM+jc@kroah.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ORDFx0R60MwDMBZJ4dfiB7iW"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ORDFx0R60MwDMBZJ4dfiB7iW
Content-Type: multipart/mixed; boundary="------------v9dVaQxCjlhQANd1qK700n00";
 protected-headers="v1"
From: Albert Zhou <albert.zhou.50@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Message-ID: <98df4ca9-082c-ca31-a72a-5fbd62f26d9a@gmail.com>
Subject: Re: [PATCH net-next 2/2] Update R8152 module to v2 obtained from the
 Realtek website, included in a comment in r8152.c. The only other
 modification to r8152.c is amending netif_napi_add, see comment for
 explanation.
References: <20221104132526.64530-1-albert.zhou.50@gmail.com>
 <20221104132526.64530-3-albert.zhou.50@gmail.com>
 <Y2UkZpD+xeShM+jc@kroah.com>
In-Reply-To: <Y2UkZpD+xeShM+jc@kroah.com>

--------------v9dVaQxCjlhQANd1qK700n00
Content-Type: multipart/mixed; boundary="------------YYVENUPa850s1hsOFf8WBv03"

--------------YYVENUPa850s1hsOFf8WBv03
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgR3JlZywNCg0KSSByZWFsaXNlZCBzZXZlcmFsIHRoaW5ncy4gRmlyc3RseSwgd2hlbiBJ
IGluaXRpYWxseSBjb250YWN0ZWQgeW91LCBpdCB3YXMgc2ltcGx5IGJhc2VkIG9uIGxvb2tp
bmcgdXAgd2hvIG1haW50YWluZWQgZHJpdmVycy9uZXQvdXNiIGluIHRoZSBNQUlOVEFJTkVS
UyBmaWxlLCBob3dldmVyIHdoZW4gcnVubmluZyBzY3JpcHRzL2dldF9tYWludGFpbmVyLnBs
LCBJIHJlYWxpc2UgdGhhdCB0aGVyZSBhcmUgbWFueSBvdGhlciBwZW9wbGUgd2hvIG1haW50
YWluIGRyaXZlcnMvbmV0L3VzYi9yODE1Mi5jLiBTaG91bGQgSSBpbmNsdWRlIHRoZW0gaW4g
ZnV0dXJlIHN1Ym1pc3Npb25zPyBPciBzaG91bGQgSSBqdXN0IHN0aWNrIHRvIHlvdSBmb3Ig
bm93Pw0KDQpTZWNvbmRseSwgcnVubmluZyBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgb24gUmVh
bHRlaydzIGNvZGUgZ2l2ZXMgbWFueSB3YXJuaW5ncyBhbmQgZXJyb3JzLiBFLmcuIHRoZSBj
b2RlIGlzIHdyaXR0ZW4gdG8gYmUgY29tcGF0aWJsZQ0KZm9yIG9sZCB2ZXJzaW9ucyBvZiB0
aGUga2VybmVsLCB3aGVyZWFzIGNoZWNrcGF0Y2gucGwgaW5zaXN0cyB0aGF0IGVhY2gga2Vy
bmVsIHZlcnNpb24gc2hvdWxkIGhhdmUgZGVkaWNhdGVkIGNvZGUgZm9yIGl0c2VsZi4NCg0K
SSBhbSBoZXNpdGFudCB0byBlZGl0IHRoZSBvcmlnaW5hbCBjb2RlIG1vcmUgdGhhbiBJIGFs
cmVhZHkgaGF2ZSwgYnV0IGlmIG5lY2Vzc2FyeSwgSSBjYW4gbWFrZSBhbm90aGVyIHBhdGNo
IHdoZW4gSSByZXN1Ym1pdCB0byBpcm9uIG91dCBhbGwgdGhlIHRyaXZpYWwgc3R5bGUgaXNz
dWVzLiBIb3dldmVyIEkgbWF5IG5lZWQgc29tZSBndWlkYW5jZSwgZS5nLiBvbiB0aGUgdXNl
IG9mIHRoZSB2b2xhdGlsZSBrZXl3b3JkOyBzaW5jZSBJIGFtIG5vdCB0aGUgb3JpZ2luYWwg
ZGV2ZWxvcGVyLCBpdCB3aWxsIGJlIGRpZmZpY3VsdCBmb3IgbWV0IHRvIGp1ZGdlIHdoZXRo
ZXIgaXRzIHVzYWdlIGlzIGNyaXRpY2FsIGZvciB0aGUgY29kZS4NCg0KVGhpcmRseSwgaWYg
SSBkbyByZW1vdmUgYWxsIG9mIHRoZSBtYWNyb3MgZm9yIGJhY2t3YXJkcyBjb21wYXRpYmls
aXR5LCAoIyBpZiBMSU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZFUlNJT04oYSxiLGMp
KSwgaXQgd2lsbCBiZSBkaWZmaWN1bHQgZm9yIGRpc3Ryb3MgbGlrZSBVYnVudHUgdG8gaW5j
b3Jwb3JhdGUgdGhlIHVwZGF0ZWQgbW9kdWxlIGludG8gdGhlaXIgb2xkZXIga2VybmVscy4g
IEhvdyBjYW4gdGhlIHZlcnNpb24tdHdvIG1vZHVsZSBhbHNvIGJlIGluY2x1ZGVkIGluIHRo
ZSBvdGhlciBzdGFibGUvbG9uZ2VybSBrZXJuZWxzPw0KDQpCZXN0LA0KDQogRnJvbSBBbGJl
cnQgWmhvdQ0KDQpPbiA1LzExLzIyIDAxOjQwLCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBTYXQs
IE5vdiAwNSwgMjAyMiBhdCAxMjoyNToyNkFNICsxMTAwLCBBbGJlcnQgWmhvdSB3cm90ZToN
Cj4+IC0tLQ0KPj4gICBkcml2ZXJzL25ldC91c2IvcjgxNTIuYyAgICAgICAgICAgICAgIHwg
MTc5MzggKysrKysrKysrKysrKysrKysrKy0tLS0tDQo+PiAgIGRyaXZlcnMvbmV0L3VzYi9y
ODE1Ml9jb21wYXRpYmlsaXR5LmggfCAgIDY1OCArDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwg
MTUxMzAgaW5zZXJ0aW9ucygrKSwgMzQ2NiBkZWxldGlvbnMoLSkNCj4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvbmV0L3VzYi9yODE1Ml9jb21wYXRpYmlsaXR5LmgNCj4+DQo+
IA0KPiBIaSwNCj4gDQo+IFRoaXMgaXMgdGhlIGZyaWVuZGx5IHBhdGNoLWJvdCBvZiBHcmVn
IEtyb2FoLUhhcnRtYW4uICBZb3UgaGF2ZSBzZW50IGhpbQ0KPiBhIHBhdGNoIHRoYXQgaGFz
IHRyaWdnZXJlZCB0aGlzIHJlc3BvbnNlLiAgSGUgdXNlZCB0byBtYW51YWxseSByZXNwb25k
DQo+IHRvIHRoZXNlIGNvbW1vbiBwcm9ibGVtcywgYnV0IGluIG9yZGVyIHRvIHNhdmUgaGlz
IHNhbml0eSAoaGUga2VwdA0KPiB3cml0aW5nIHRoZSBzYW1lIHRoaW5nIG92ZXIgYW5kIG92
ZXIsIHlldCB0byBkaWZmZXJlbnQgcGVvcGxlKSwgSSB3YXMNCj4gY3JlYXRlZC4gIEhvcGVm
dWxseSB5b3Ugd2lsbCBub3QgdGFrZSBvZmZlbmNlIGFuZCB3aWxsIGZpeCB0aGUgcHJvYmxl
bQ0KPiBpbiB5b3VyIHBhdGNoIGFuZCByZXN1Ym1pdCBpdCBzbyB0aGF0IGl0IGNhbiBiZSBh
Y2NlcHRlZCBpbnRvIHRoZSBMaW51eA0KPiBrZXJuZWwgdHJlZS4NCj4gDQo+IFlvdSBhcmUg
cmVjZWl2aW5nIHRoaXMgbWVzc2FnZSBiZWNhdXNlIG9mIHRoZSBmb2xsb3dpbmcgY29tbW9u
IGVycm9yKHMpDQo+IGFzIGluZGljYXRlZCBiZWxvdzoNCj4gDQo+IC0gWW91ciBwYXRjaCBj
b250YWlucyB3YXJuaW5ncyBhbmQvb3IgZXJyb3JzIG5vdGljZWQgYnkgdGhlDQo+ICAgIHNj
cmlwdHMvY2hlY2twYXRjaC5wbCB0b29sLg0KPiANCj4gLSBZb3VyIHBhdGNoIGRvZXMgbm90
IGhhdmUgYSBTaWduZWQtb2ZmLWJ5OiBsaW5lLiAgUGxlYXNlIHJlYWQgdGhlDQo+ICAgIGtl
cm5lbCBmaWxlLCBEb2N1bWVudGF0aW9uL1N1Ym1pdHRpbmdQYXRjaGVzIGFuZCByZXNlbmQg
aXQgYWZ0ZXINCj4gICAgYWRkaW5nIHRoYXQgbGluZS4gIE5vdGUsIHRoZSBsaW5lIG5lZWRz
IHRvIGJlIGluIHRoZSBib2R5IG9mIHRoZQ0KPiAgICBlbWFpbCwgYmVmb3JlIHRoZSBwYXRj
aCwgbm90IGF0IHRoZSBib3R0b20gb2YgdGhlIHBhdGNoIG9yIGluIHRoZQ0KPiAgICBlbWFp
bCBzaWduYXR1cmUuDQo+IA0KPiAtIFlvdXIgcGF0Y2ggZGlkIG1hbnkgZGlmZmVyZW50IHRo
aW5ncyBhbGwgYXQgb25jZSwgbWFraW5nIGl0IGRpZmZpY3VsdA0KPiAgICB0byByZXZpZXcu
ICBBbGwgTGludXgga2VybmVsIHBhdGNoZXMgbmVlZCB0byBvbmx5IGRvIG9uZSB0aGluZyBh
dCBhDQo+ICAgIHRpbWUuICBJZiB5b3UgbmVlZCB0byBkbyBtdWx0aXBsZSB0aGluZ3MgKHN1
Y2ggYXMgY2xlYW4gdXAgYWxsIGNvZGluZw0KPiAgICBzdHlsZSBpc3N1ZXMgaW4gYSBmaWxl
L2RyaXZlciksIGRvIGl0IGluIGEgc2VxdWVuY2Ugb2YgcGF0Y2hlcywgZWFjaA0KPiAgICBv
bmUgZG9pbmcgb25seSBvbmUgdGhpbmcuICBUaGlzIHdpbGwgbWFrZSBpdCBlYXNpZXIgdG8g
cmV2aWV3IHRoZQ0KPiAgICBwYXRjaGVzIHRvIGVuc3VyZSB0aGF0IHRoZXkgYXJlIGNvcnJl
Y3QsIGFuZCB0byBoZWxwIGFsbGV2aWF0ZSBhbnkNCj4gICAgbWVyZ2UgaXNzdWVzIHRoYXQg
bGFyZ2VyIHBhdGNoZXMgY2FuIGNhdXNlLg0KPiANCj4gLSBZb3UgZGlkIG5vdCBzcGVjaWZ5
IGEgZGVzY3JpcHRpb24gb2Ygd2h5IHRoZSBwYXRjaCBpcyBuZWVkZWQsIG9yDQo+ICAgIHBv
c3NpYmx5LCBhbnkgZGVzY3JpcHRpb24gYXQgYWxsLCBpbiB0aGUgZW1haWwgYm9keS4gIFBs
ZWFzZSByZWFkIHRoZQ0KPiAgICBzZWN0aW9uIGVudGl0bGVkICJUaGUgY2Fub25pY2FsIHBh
dGNoIGZvcm1hdCIgaW4gdGhlIGtlcm5lbCBmaWxlLA0KPiAgICBEb2N1bWVudGF0aW9uL1N1
Ym1pdHRpbmdQYXRjaGVzIGZvciB3aGF0IGlzIG5lZWRlZCBpbiBvcmRlciB0bw0KPiAgICBw
cm9wZXJseSBkZXNjcmliZSB0aGUgY2hhbmdlLg0KPiANCj4gLSBZb3UgZGlkIG5vdCB3cml0
ZSBhIGRlc2NyaXB0aXZlIFN1YmplY3Q6IGZvciB0aGUgcGF0Y2gsIGFsbG93aW5nIEdyZWcs
DQo+ICAgIGFuZCBldmVyeW9uZSBlbHNlLCB0byBrbm93IHdoYXQgdGhpcyBwYXRjaCBpcyBh
bGwgYWJvdXQuICBQbGVhc2UgcmVhZA0KPiAgICB0aGUgc2VjdGlvbiBlbnRpdGxlZCAiVGhl
IGNhbm9uaWNhbCBwYXRjaCBmb3JtYXQiIGluIHRoZSBrZXJuZWwgZmlsZSwNCj4gICAgRG9j
dW1lbnRhdGlvbi9TdWJtaXR0aW5nUGF0Y2hlcyBmb3Igd2hhdCBhIHByb3BlciBTdWJqZWN0
OiBsaW5lIHNob3VsZA0KPiAgICBsb29rIGxpa2UuDQo+IA0KPiBJZiB5b3Ugd2lzaCB0byBk
aXNjdXNzIHRoaXMgcHJvYmxlbSBmdXJ0aGVyLCBvciB5b3UgaGF2ZSBxdWVzdGlvbnMgYWJv
dXQNCj4gaG93IHRvIHJlc29sdmUgdGhpcyBpc3N1ZSwgcGxlYXNlIGZlZWwgZnJlZSB0byBy
ZXNwb25kIHRvIHRoaXMgZW1haWwgYW5kDQo+IEdyZWcgd2lsbCByZXBseSBvbmNlIGhlIGhh
cyBkdWcgb3V0IGZyb20gdGhlIHBlbmRpbmcgcGF0Y2hlcyByZWNlaXZlZA0KPiBmcm9tIG90
aGVyIGRldmVsb3BlcnMuDQo+IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGstaCdzIHBhdGNo
IGVtYWlsIGJvdA0K
--------------YYVENUPa850s1hsOFf8WBv03
Content-Type: application/pgp-keys; name="OpenPGP_0x218FE344C5A6867D.asc"
Content-Disposition: attachment; filename="OpenPGP_0x218FE344C5A6867D.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEYkX5gxYJKwYBBAHaRw8BAQdAsW8QQjKnmpKC5G1d1QFYNvd9ddMxwYZs+xTT
0dyqvtbNJkFsYmVydCBaaG91IDxhbGJlcnQuemhvdS41MEBnbWFpbC5jb20+wosE
ExYIADMWIQRLx2w8czp1EBJaieEhj+NExaaGfQUCYkX5gwIbAwULCQgHAgYVCAkK
CwIFFgIDAQAACgkQIY/jRMWmhn2rKAEAlOVVAsYIpmGTEng+e/HHT7JJjCjcX4lh
+pFZdUy2DGgBAM/EwKNYoNB43H5EJpb8I68MS+ZZSQ3swJWAu1OJKXIJzjgEYkX5
gxIKKwYBBAGXVQEFAQEHQNk/Nf/E1Uttgm29quUBXgc9RDwqKTHbtHLS5SOkZzhU
AwEIB8J4BBgWCAAgFiEES8dsPHM6dRASWonhIY/jRMWmhn0FAmJF+YMCGwwACgkQ
IY/jRMWmhn0KRwD7Bv1kWYB2m8c5tRQUg7i3zIaJ4kpfqMj4bwYQ9xEke3oA/11C
MCzdPMcoveB279og31mtUISG5mXMDJmiE4y61akN
=3D+2qf
-----END PGP PUBLIC KEY BLOCK-----

--------------YYVENUPa850s1hsOFf8WBv03--

--------------v9dVaQxCjlhQANd1qK700n00--

--------------ORDFx0R60MwDMBZJ4dfiB7iW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRLx2w8czp1EBJaieEhj+NExaaGfQUCY2Yw8QUDAAAAAAAKCRAhj+NExaaGfXYC
AQDBjGhXdov4aUebg0ThUqpcDepnN1tV5XUJ5dLYGXjA0gEAv6wfZx1x7P39kzGE/rIY103fLvXn
ESfKJb6J4hzPiQg=
=HBVh
-----END PGP SIGNATURE-----

--------------ORDFx0R60MwDMBZJ4dfiB7iW--
