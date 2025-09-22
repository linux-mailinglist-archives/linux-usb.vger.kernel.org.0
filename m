Return-Path: <linux-usb+bounces-28481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37865B91EFF
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 17:31:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7182F3AE151
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 15:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DB82E764A;
	Mon, 22 Sep 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="bO50ZOT0"
X-Original-To: linux-usb@vger.kernel.org
Received: from sonic317-38.consmr.mail.ne1.yahoo.com (sonic317-38.consmr.mail.ne1.yahoo.com [66.163.184.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6514319CC37
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 15:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.163.184.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758555090; cv=none; b=CJ31+eCf2z9779C73GQTevgj8VvqY+7OqIzVbagc4RRwudD08+t8INA+UZToDlsZmToROHEXkYU5xCIoHwdL7qw14kzwSH/Jt9xJXimYREgwS4O6UIYG07KcojGwIXGI+Et9bKJ0IMACEYldu6fah8Dv4+EVXkkkP6MeeZEOZ9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758555090; c=relaxed/simple;
	bh=I0AUswnxQZMNWi9R80zf6vvWy6tCAhYx2psliAWUAZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LJ/SPRL1admKflbEe3rnwtaDRZREAUBOYuCTiIJfKePgmZwWVvwlzFDCr3+gYjFPlmk7CNcSIwGfNyZZAp7pxPlYB365q7aH86h4CixzAn7+cCLw5y/3NZMiG5OEjrjsGgQpNDDCDotFDRffLzmtcpD3akS/3iVHSNBIQOxuTE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com; spf=none smtp.mailfrom=schaufler-ca.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=bO50ZOT0; arc=none smtp.client-ip=66.163.184.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=schaufler-ca.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=schaufler-ca.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1758555088; bh=4InEgJCpBgl3urehuyUAnpN3vmaPh6mhZWLVpIhzL0s=; h=Date:Subject:To:Cc:References:From:In-Reply-To:From:Subject:Reply-To; b=bO50ZOT0lxL7mktgwnwWLJNi+zxKK1NjI7eoOh3qS/O0k1vJQXQTI6j/avjPdVqugkSd6Z3xKKbMxfrhrCVO8ze/aLW8Fugz7apqwRdZwStlCOQAv/AUl94nnLQxye1KCaeaYuetQZck8gfVaGhiXXGJkJa10UjHULtEd8xVddFsc51EnQkiMJGTDvP73jUB73BLuUleyG1GSIykvkT/f1aChjSbHlpEcnXbnFb70q8if+EAwvn7i9oUH4wCAZp4n7qDxqgFyWJL9ZQIDEfeUm8+gQPyxz1fFzyeMiIkfq07dBWDxoYHqiLXttZwbME0Mq6ymOK56TRfe6eZaeZG1g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1758555088; bh=AbuDafgYZ4dvoWL2C3rUd3R0Hc8NdDVL18oaw7Ocu4s=; h=X-Sonic-MF:Date:Subject:To:From:From:Subject; b=rDYsO42tHwRlldmWpyF5PBSjWyC9CPoVHa4bW32WwV4eK+/Oz4hCxAJL2i+VZw5j7YB8YaDFbt5U4DllQHzdYwHMZfzaqsIfaPMV9wj3SjCilLp4uryDt75NxaonpybRHLc2U8Gq27oRmMJZyTn08aIaef725tUaCI3p9HJdUVF8ptKCNEBuiPcKtjynPh3Bf59Z7vOHqPlUDGgnDPobx8AS3aThwH7PgvWVSKlq7KxA1MQUiIS1sTqqa0LT0BuemEmInK3XY3popmgRuqjpx+Mh7D2b0stSSafO6FaPX/ma7MnxsdYn5ekRWzhNhxJ1ryP8Tt9+4Rk0UB5tLY2LMA==
X-YMail-OSG: a0ShGM0VM1kS5TdAKyhzMZn1kR2BVScsxCyqUC96KXfqWNmQ7dmcDUkr2C6CD8o
 F.nNwGtrFxyWKgcaKU7c7SzY5sLRNB.kOmj5_1Qm6ugm1qKEKbdGmcF7HD5CS6uaMhzE.a9se2Qm
 F1aP8aIzBCHkxN5RNu9eVRSUSnetYV4eQU1XVm4hTaEV4BvxehZwefxFMd6x0JG.j4dEDQi93AD1
 otuyzSX1.GPHdlyHguPAligClB4vPQXogx4pmPFUNZvIgnYUj3ZAP.eaGvtLAJBWwJZIid7F8Yl7
 fS1HoQ7Jn3KoiQxx99h22rBrZa75BNGmyO0gktHMEZP6MXXhe53TSWat_vR8FAYXp_VD4R4oJuz0
 DW.oPlaIk1ghcJ.KbdLt0LsHV4.48F61tmZEA3FvDg6dnsPKuRGJnMhywRU4K6.kIxo9YPvXQjHB
 F0IEgZLPfOcJ8vj_r5t6ph71MsJq.FE_dJwSDuVWC2OfTIwu3UL950I4YXO0txdngQH3weqQJq6v
 Gd0etDBRenLr.nP4ZVooL08C.kalSnyjilbjQ6hVCbAJFQ5ac5tNMA0yqzDKczYaots_sFff8rvv
 U5vBtTDHFGj9pG1htEk98Bie3Sr1Rh3DfjslgmdEQKnh1_RrMAZSOAa.07QtYLdpDe2ASHqoxstq
 qYaXJgEdH5PCYA35nG5kb60ezbJkPPwOgISysqsYtBczyL7aM0o_YWb87zjEpMrncOBftQRPUxzI
 yY2X1SAcAlN74EUshXhNxN7bDz0fJ9pyw6Z2FsRjy8NP0ZZgh77q88u5.20P4ilTVK7xnx3zwYf4
 Uzh2YFJ6lpxu_av3Ty_RSjjqPs_hrHqzS4E2lP1u8zR0J5nKWFZkiuKSJTrN8DJgClAmJqKAahC0
 NDUnpko2yADSzuuEpuBlBsqp8tv6uhW8teFJt.gLBrwD3pm5T1jSk.0wbeWpfWdlekkEEZwV3NPS
 xZ7VgGeoZC1jxaMek4SWmhHxcE34bMEKU.ZgnVDtv1vB2BQqLi_s6d77dWDiquPUaQAUCXKkMaQP
 uhDhqmwm8pzBqj2r0bYaLSBcqFrAk51e5s4ikqTrwey9HRuUMMB8Eh2Y1HQR9LL_GE.p6iKBKxnX
 nIXVe7cgbeMhuuSyEyhK5k_DGnSaPAqBjwhWbkQQ0EBc3l6dBpb4.Oz6IoO_8WCoLqoiiNyfdai.
 bJqa6nOKQrPDM66mVqWCrlXJ6g1wtUV7f9_RR3ivDzll782rXlyXthQ7MUGtc1O4ztwW9feR0AFR
 uC4vfcZi7p42Pwj2PiMqaKleTA3XAs8ovvKSBT_szRVp_5si5CjN8VyeemuMZTkLEg.rLNOiNPCG
 ytsLPAaDfYvVFrPfcdyYVnIQ2F2svsSmcLS6d07AwqKDkUlZFTirlX5SPJb30aKtLsfZA2vXA1dX
 byb6p2XV5WARbEoql4FkflHp67betBxxYfMoBuk5wsBX.R08duRAeIA7ywEmn2K_jb6_P91vCYMA
 AbckozoJFCLrgV6CWtns8rSzy395xhacTQzNQERJ8u6dQJMrmDYQtaS9J7y33Fwf1vHuWoK09FpM
 l8kJwIWULCnK5tjBv7iWW6LyslPyakaCL6mla8FXtIRDOQbAeGbSfW1aSxgcC89DZHcc2bM0x8e5
 sBoSsKO.AGS65jFjJYffvA9clbSmTISPOj4t64jG0sZpeeCe8VIxXz7WWTqU0XxkmCWiYwIn6KV_
 aUtD_EmSIWjW.J3jq2SVufM16hzqmUzhgU1aFQiACBwp.U2rG._edaOcsQrGJYKlS8tWmS4PL22D
 jSQIOAzuGq548u_mkww0AMgNAVQvlG67kcZ6SNXiFjW.k5iAUl1TlfCPEdCqsi8GWQRdneOBomfT
 ueajbwUt99M2nKlAjWvxQ_hy0RWGK3Ij4TWwNUYFNIsCXb0AsEOgYljPYO3dSJ0UbJwD6wzpABrG
 yZP5OsJLBK6ojQjJFmlGDMCbP7c5vxhge0mlgEPh6ACFt6Pqodho68OWazPnWVRIDSME785Zll_g
 CCQ9BuMOs.kMWTm4pGh28YO3BgmPcOl4hV.JK8XCiEgQY.4EQko2_W9u3bFfLa.Rdf_KvchZbSnR
 YcjkZQL3Gjhl21R0v_mm0v7UmSWebJxuIgVF4JOQehB9F_WNlcDfoawNwAtelzKXFXTaFRp_C6wK
 eszOxCUPqTPOQ_dI8MUlSoTR6Ga9y3m4NFIPKfqe_INBR5CwIx2F23bdEgas1vlI64GNmzsihuP2
 lxI_3RbdGVHuDr69RVlRtRbANidYaUSGf53wBBeZlpqudBL7u_btetqsP2Keq_y6GEDrgR_icQFg
 BgrZFVqwNWg479To-
X-Sonic-MF: <casey@schaufler-ca.com>
X-Sonic-ID: 2c354591-3949-4080-84f2-5cc1785b2062
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Mon, 22 Sep 2025 15:31:28 +0000
Received: by hermes--production-gq1-6f9f7cb74b-2n2jr (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 5a83043d0b8f6a0e34f3bfd1c61ea603;
          Mon, 22 Sep 2025 15:11:07 +0000 (UTC)
Message-ID: <8403fd9a-6667-4202-bd5b-5e83172961b3@schaufler-ca.com>
Date: Mon, 22 Sep 2025 08:11:05 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/39] convert smackfs
To: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Cc: torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz,
 raven@themaw.net, miklos@szeredi.hu, a.hindborg@kernel.org,
 linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, paul@paul-moore.com,
 linuxppc-dev@lists.ozlabs.org, borntraeger@linux.ibm.com,
 Casey Schaufler <casey@schaufler-ca.com>
References: <20250920074156.GK39973@ZenIV>
 <20250920074759.3564072-1-viro@zeniv.linux.org.uk>
 <20250920074759.3564072-10-viro@zeniv.linux.org.uk>
Content-Language: en-US
From: Casey Schaufler <casey@schaufler-ca.com>
In-Reply-To: <20250920074759.3564072-10-viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.24425 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo

On 9/20/2025 12:47 AM, Al Viro wrote:
> Entirely static tree populated by simple_fill_super().  Can use
> kill_anon_super() as-is.
>
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>

Looks fine to me.
Acked-by: Casey Schaufler <casey@schaufler-ca.com>

> ---
>  security/smack/smackfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/security/smack/smackfs.c b/security/smack/smackfs.c
> index b1e5e62f5cbd..e989ae3890c7 100644
> --- a/security/smack/smackfs.c
> +++ b/security/smack/smackfs.c
> @@ -2960,7 +2960,7 @@ static int smk_init_fs_context(struct fs_context *fc)
>  static struct file_system_type smk_fs_type = {
>  	.name		= "smackfs",
>  	.init_fs_context = smk_init_fs_context,
> -	.kill_sb	= kill_litter_super,
> +	.kill_sb	= kill_anon_super,
>  };
>  
>  static struct vfsmount *smackfs_mount;

