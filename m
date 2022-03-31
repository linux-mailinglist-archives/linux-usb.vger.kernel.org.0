Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 108C14EDDD9
	for <lists+linux-usb@lfdr.de>; Thu, 31 Mar 2022 17:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238844AbiCaPtw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Mar 2022 11:49:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239787AbiCaPs0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Mar 2022 11:48:26 -0400
Received: from devnull.tasossah.com (devnull.tasossah.com [IPv6:2001:41d0:1:e60e::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6998B1D12F1
        for <linux-usb@vger.kernel.org>; Thu, 31 Mar 2022 08:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=devnull.tasossah.com; s=vps; h=Content-Type:In-Reply-To:Subject:From:
        References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ZXlsLW3EJE7DG9gwEBPT8eJm0fAlaUb/FzeBzpQ82og=; b=VdQ0bojc/uM7+y/5gYlXZbNGA
        uTmaDJCq5wQ1gnxPHt0Vl+HrMg8wDVmxpuAfI5pd010GtF1hxujo7Eapdb6UOaaCsDqABMsDW1G19
        VJHanxQZCyzFcgzVrOv+wDdN1dzDmbbPCxUXAbOa0z289O+D4N56lsjm+xSqNC3gn5Oz8=;
Received: from [2a02:587:6a16:2a00::298]
        by devnull.tasossah.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <tasos@tasossah.com>)
        id 1nZwzL-00AVJl-AV; Thu, 31 Mar 2022 18:45:31 +0300
Message-ID: <caa2826c-3ac4-dbea-50d0-929db47b02d4@tasossah.com>
Date:   Thu, 31 Mar 2022 18:45:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
References: <2450973f-d665-82b9-6734-4b57f95a2be3@tasossah.com>
 <YkB94MnkBhadLVi8@rowland.harvard.edu>
From:   Tasos Sahanidis <tasos@tasossah.com>
Subject: Re: [PATCH v2] usb: core: Don't block while sleeping in
 do_proc_control()
In-Reply-To: <YkB94MnkBhadLVi8@rowland.harvard.edu>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------97ZcnvvEKoMDChRbQSEHwLMQ"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------97ZcnvvEKoMDChRbQSEHwLMQ
Content-Type: multipart/mixed; boundary="------------n0nA4if2MNfQL07H5Deadcbw";
 protected-headers="v1"
From: Tasos Sahanidis <tasos@tasossah.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Message-ID: <caa2826c-3ac4-dbea-50d0-929db47b02d4@tasossah.com>
Subject: Re: [PATCH v2] usb: core: Don't block while sleeping in
 do_proc_control()
References: <2450973f-d665-82b9-6734-4b57f95a2be3@tasossah.com>
 <YkB94MnkBhadLVi8@rowland.harvard.edu>
In-Reply-To: <YkB94MnkBhadLVi8@rowland.harvard.edu>

--------------n0nA4if2MNfQL07H5Deadcbw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2022-03-27 18:08, Alan Stern wrote:
> You might want to change the patch name, however.  "Block" usually mean=
s=20
> pretty much the same thing as "sleep"; i.e., a process is blocked if it=
=20
> can't move forward.  The name should be something like "Don't hold the =

> device lock while sleeping in do_proc_control()".

The name does indeed need improvement, thank you for the explanation. I
was unable to come up with a better one, so I will submit v3 with the
name you suggested.

--------------n0nA4if2MNfQL07H5Deadcbw--

--------------97ZcnvvEKoMDChRbQSEHwLMQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEEsXLJ1Ds+HVUj+TWiAaHcuiLgBcQFAmJFzI8FAwAAAAAACgkQAaHcuiLgBcRK
Jw/+OyLdWtU2d+Fu7bPZ0a02oZz+s54b71V9af8eg2XgCmWErzVL84WgsLhJ9yKVcmNbe19s1C3V
XJNoA8oC4QgW9yrRr1UosipblWSl5A/PmlsRGur7deMyeTikUZgcPURgwCHE2e9RAFvsDe9CKPSP
cNfhWFYk7xUWuiCNh/IbPvi9oWFuHL6IniS+HNZOmS5wqoan+GJIkWH6buQ1hHUM8erbydUtOjM0
uQiHMhZ3nRUjBZAuFxzMBjiZ+v80hdaHK/TWJcDNifoYPf0yL/HQ/mIHF5/e6RlLzM1CTzicJ6e1
kKffb8zYBfG6WaSXdg6LPP1ospOUHm4uDm7WFw8zzJkUZAIFTQbjLUzNMOvyjzP3WRTdWelEttrz
JtCfHkboHqeRmOCoN7o5tuEEgxhBe2MEaouodD6UglIEw4902FNv2Stn2VAPR59pVYWxUXWWpedK
IsuMKhOZ35OaChKjFVMjJkKCAqj4prvJaeNGVVOt1ZyKLIv7nAZmaXMQOOxiW9LcBbM0S/PUfDfH
qqLJNK4aPB2NzoJK8mt3YX+BV9innxuurxdpK7q8YCwX+/qOppPHerXndqWD8JpX9lwp+qBK9spo
0T14GE8ezYuWe4ksfPsBipUxz9aLRI9CHRB5Wy/92yNPCHhS9piRHzieUhxktmlp9bN50TQDdsTT
hKQ=
=rUQ5
-----END PGP SIGNATURE-----

--------------97ZcnvvEKoMDChRbQSEHwLMQ--
