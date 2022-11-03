Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297B3617B34
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 12:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231290AbiKCLAP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 07:00:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbiKCLAN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 07:00:13 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A05163AC
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 04:00:10 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id f5-20020a17090a4a8500b002131bb59d61so5219634pjh.1
        for <linux-usb@vger.kernel.org>; Thu, 03 Nov 2022 04:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=autocrypt:subject:from:content-language:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Aqf7pFPzhT29hpUxWZB53yOxzjtIJTfmtGOLNnOR9D4=;
        b=FflOuyY9vKV9dAOps/lnRDLuXux0iQw0N/0WcARlgMs1PjvnfKdckZNVfdckANeMLZ
         mpYpRpZjYC3iqLEUh2oM+DLYxYpODxlaqO+8F/V4k8E8ImWfo8Glm6GWSE4nEz3LiGR/
         AudsIg+QuqCCgdXYZDMFMtmrFDdIGLodvAcEId9R11Bh1zedgEn7xNuQKI5huIBN1T+e
         RmXReM98Sll6TwmGCUvIMSMxP9yamseL8rc1SRLwUYjskSc6qbsJJGgj5N7oDNA0fv4o
         LSatb1DUmPpIR+X0OmSajN8dBMI7DOYla98Az8wja1IITgDmhiPzwLg+5M2DKPpBdg8S
         ki7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=autocrypt:subject:from:content-language:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aqf7pFPzhT29hpUxWZB53yOxzjtIJTfmtGOLNnOR9D4=;
        b=fusHnkgL95NobqJnGRl+c1BEcfsl7aiC3DPLXUjR9VO0lumBylWIsps4OApuntPGLH
         7PVWZ+tjmmsSpP6tyGSM3UWzTNfdTxJ6AplEG6OMTrgxalTObBaSixlHQZfOk8Zm/V/L
         Wi/Pkd60EJinmsCv8/MrhGwtj1RppazZDJRDR+UgzUIgNv7EOXKE+niSXlLBALENmvcr
         dx1bUr6hDdEQ7VgMla//McJqcS9XcCjn4pDbf42Xn2SIOeU/sz60aM1ju1BSfFX33XlB
         qMe7Xyuanll+qVm6RyvL01hyaxZrhrt2M8qnGHJcoAik5qCZaTJl5Mve1hKHgRLaKsdA
         mEpw==
X-Gm-Message-State: ACrzQf1+m3pyhE6ULwV1KCdaoppBiny+uwL17cWBHgU8kcwfjXSJVHcs
        +jniI5cgHlDeWyDiOvIR3hhQZqg7sXo=
X-Google-Smtp-Source: AMsMyM4RFIgkdrAr75O8ZgBRyQSOYxJEex2pLT9hm0QgX6/FKROlYPCF9prgvpKxjRRcktXvreS2lA==
X-Received: by 2002:a17:902:c702:b0:186:e151:6b27 with SMTP id p2-20020a170902c70200b00186e1516b27mr30170071plp.69.1667473209494;
        Thu, 03 Nov 2022 04:00:09 -0700 (PDT)
Received: from ?IPV6:2405:6e00:496:f944:a6ae:89b7:6dc1:907b? ([2405:6e00:496:f944:a6ae:89b7:6dc1:907b])
        by smtp.gmail.com with ESMTPSA id x29-20020aa7941d000000b0056bf4f8d542sm485091pfo.74.2022.11.03.04.00.07
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 04:00:08 -0700 (PDT)
Message-ID: <f36495ab-4fa6-a3b1-23b9-f970cd2870ce@gmail.com>
Date:   Thu, 3 Nov 2022 22:00:04 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To:     linux-usb@vger.kernel.org
Content-Language: en-AU
From:   Albert Zhou <albert.zhou.50@gmail.com>
Subject: r8152 module out of date
Autocrypt: addr=albert.zhou.50@gmail.com; keydata=
 xjMEYkX5gxYJKwYBBAHaRw8BAQdAsW8QQjKnmpKC5G1d1QFYNvd9ddMxwYZs+xTT0dyqvtbN
 JkFsYmVydCBaaG91IDxhbGJlcnQuemhvdS41MEBnbWFpbC5jb20+wosEExYIADMWIQRLx2w8
 czp1EBJaieEhj+NExaaGfQUCYkX5gwIbAwULCQgHAgYVCAkKCwIFFgIDAQAACgkQIY/jRMWm
 hn2rKAEAlOVVAsYIpmGTEng+e/HHT7JJjCjcX4lh+pFZdUy2DGgBAM/EwKNYoNB43H5EJpb8
 I68MS+ZZSQ3swJWAu1OJKXIJzjgEYkX5gxIKKwYBBAGXVQEFAQEHQNk/Nf/E1Uttgm29quUB
 Xgc9RDwqKTHbtHLS5SOkZzhUAwEIB8J4BBgWCAAgFiEES8dsPHM6dRASWonhIY/jRMWmhn0F
 AmJF+YMCGwwACgkQIY/jRMWmhn0KRwD7Bv1kWYB2m8c5tRQUg7i3zIaJ4kpfqMj4bwYQ9xEk
 e3oA/11CMCzdPMcoveB279og31mtUISG5mXMDJmiE4y61akN
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7cNslbGzL2ftQ7xkMUNUsBpM"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7cNslbGzL2ftQ7xkMUNUsBpM
Content-Type: multipart/mixed; boundary="------------u9bqoezmI0OxelDCzCMi6Ztq";
 protected-headers="v1"
From: Albert Zhou <albert.zhou.50@gmail.com>
To: linux-usb@vger.kernel.org
Message-ID: <f36495ab-4fa6-a3b1-23b9-f970cd2870ce@gmail.com>
Subject: r8152 module out of date

--------------u9bqoezmI0OxelDCzCMi6Ztq
Content-Type: multipart/mixed; boundary="------------hHv700hTfs9K01qAR2HNv0qz"

--------------hHv700hTfs9K01qAR2HNv0qz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhlIGxpbnV4IGtlcm5lbCB2Ni4xLXJjMyBzdGlsbCBoYXMgdGhlIG9sZCB2MSBkcml2ZXIg
Zm9yIGRldmljZXMgUlRMODE1Mi9SVEw4MTUzOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJz
L25ldC91c2IvcjgxNTIuYz9oPXY2LjEtcmMzDQoNClRoaXMgcmVzdWx0cyBpbiBzbG93IGV0
aGVybmV0IHNwZWVkcyAoSSBoYWQgdGhpcyBwcm9ibGVtIGFuZCBmaXhlZCB0aGlzIGJ5IHVw
ZGF0aW5nIHRoZSBkcml2ZXIpOyBzZWUgYWxzbzoNCg0KaHR0cHM6Ly9idWd6aWxsYS5rZXJu
ZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU5MjMNCmh0dHBzOi8vYnVnemlsbGEua2VybmVs
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjEzNjg1DQpodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5v
cmcvc2hvd19idWcuY2dpP2lkPTEwMzE5MQ0KDQpJIGZpeGVkIHRoaXMgaXNzdWUgKGFsYmVp
dCBvbiB2NS4xNS4wLTUyIG9uIGFuIHVidW50dSBrZXJuZWwpIGJ5IHVwZGF0aW5nIHRoZSBk
cml2ZXIgdG8gdGhlIGxhdGVzdCB2MjogaHR0cHM6Ly93d3cucmVhbHRlay5jb20vZW4vY29t
cG9uZW50L3pvby9jYXRlZ29yeS9uZXR3b3JrLWludGVyZmFjZS1jb250cm9sbGVycy0xMC0x
MDAtMTAwMG0tZ2lnYWJpdC1ldGhlcm5ldC11c2ItMy0wLXNvZnR3YXJlDQoNClRoZSBuZXcg
ZHJpdmVyIGlzIEdQTHYyLiBJdCB3b3VsZCBiZSBncmVhdCBpZiB0aGlzIGNvdWxkIGJlIGlu
Y2x1ZGVkIGluIHRoZSBsaW51eCBrZXJuZWwuDQotLSANCiBGcm9tIEFsYmVydCBaaG91DQo=

--------------hHv700hTfs9K01qAR2HNv0qz
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

--------------hHv700hTfs9K01qAR2HNv0qz--

--------------u9bqoezmI0OxelDCzCMi6Ztq--

--------------7cNslbGzL2ftQ7xkMUNUsBpM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQRLx2w8czp1EBJaieEhj+NExaaGfQUCY2OfNAUDAAAAAAAKCRAhj+NExaaGfZsL
AQCKwjLo2gBXxSxEZeKDLyLesGg7uRYaauFSj3P7ZOeUIQEAxpLq2+w9dENmoFwgJ9BN9aLJQxCn
0Kk7gebmuly02Ag=
=7qR5
-----END PGP SIGNATURE-----

--------------7cNslbGzL2ftQ7xkMUNUsBpM--
