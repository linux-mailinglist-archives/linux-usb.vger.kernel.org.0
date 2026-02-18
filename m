Return-Path: <linux-usb+bounces-33444-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QpM+CKMilmkXbAIAu9opvQ
	(envelope-from <linux-usb+bounces-33444-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:35:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B489159795
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA9AE302834D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 20:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3637F346FAD;
	Wed, 18 Feb 2026 20:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Ed1bIf+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C75309F1F
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 20:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771446943; cv=pass; b=FP2uPswSIQTq6J3dJFz6vAl0WYLwJl4kj7AofDYQU1I/e+KUAqtDNCIRVvBQT50cy9gjcvYke1w+4STwrx9cFughhzYqHpfjWWDwC54+Xb9B+P1F/YAd3qjgjyFHWqPuRE8jN5GKTiMNn/pW4SLkVCOk+cGWOHlHmXiVi6MPWMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771446943; c=relaxed/simple;
	bh=LIh4BTZCtyYPbQOxhDPRIb+UTfgiwOWXBkNNceQHlFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kn3mxTtJSvEDsBV3RWRxbi8/mSn1pP7T8hGyeg4hOJp2fX88mxV5kxPbYzVhNUE98TcyRqVmo2+y0kA9Up9X81qnDvGgjGLbXQ9IilpmxkvPsXMFVnT+1u1qooqBJGHl04rhOiQgMHcD4JSynCi85xhCEQlFKEGtFnECwE8zMxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Ed1bIf+; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40438e0cba6so164714fac.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 12:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771446941; cv=none;
        d=google.com; s=arc-20240605;
        b=OAYJBY03SSIpyjfuPul4uSJuVrjRv68V7tQwd1vRHM4z8OYkDUMEWUlesEfiGX1fnX
         Woo+gnPUHHeI8gGaccS1Le7lyBMBNzgM/7XFDMfVt7WC2EPNuxm21TiZ90wWSoGfuz1G
         CD1/2y4iJnEpy5druyV1Yi3FI718vEnF3z8owQiY0x2otgBO+m4e0iuwhVc7KAjNvyRI
         v5m0p+GFAGMPuaptP+mHztb18BLqf2ZE4+2GQpYCR2pECwm5wmC1jmVdwIlTGHk0dcnO
         UoTP3kKt4LDVUbu5xUlzfYe4gwD99DnZ7qXzgR8zyk6rUhlDOyKS9k5wVbLLHAjGYPy8
         0a7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5flrAL4sVMxy9dAxCRRk+4HVhFBypoFV9t7l60ETjW8=;
        fh=nWb1+kLJCLlTXbNaIVEb5jHtjwtnglpXqIMWui01YXU=;
        b=d7Xoad2i2cxLI6sT5Dq98/DG1CG11neI0ZKfiUtYNrhuuHLZ2tgB6tl+/ludzqWOFy
         I0OZnMx+dDquJ6rmwji89Ay4yX0azh+M78JDtbIXwAumdt/C1hXo+H+kwLFkND65ftlb
         T8WqV/UO17rsDpOyt6bJDqLCTC+d/sYNG5mHDrYVWUC9/ksPejZvD8SXIPcGAZ4X72FF
         W3i6BGRVaVSJv/IOakxDEOT4mSndusXxIoH0Jbum8hQayIwLONtuX5uuZrQ7VGC7Zxa7
         HOe/SAmmpROLj/fCny5CBei2zUF0IrNhNlYzGat47IonkWfT5TZbS2DW/WWT+uZiMUQk
         aQFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771446941; x=1772051741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5flrAL4sVMxy9dAxCRRk+4HVhFBypoFV9t7l60ETjW8=;
        b=3Ed1bIf+VLz9kpwFFktZoM07nxZ/1eXrmlE4KNMqwrhpm3+ezLZsABjDSv1ebxTCEZ
         upXrdxy1phR7Wd2XdGBQ/yGEBMH2AB337o+9dUAPAylx9EEcdlMCs3Mb0zGSSmxFtudO
         UyWUilD5XSbJqpP1SnO4marTaYeQvyuwN7RXV6tZhQ6GqNwAowZfyMJFEg1SFS2Ao31R
         0b4DVPJMzOpmy8XJp+yjw2Jv1HcFUo+1HnfoDSWae+5csBJ6ifyQ+t40t3Xw8zgz+L88
         FGs9ndTcYWFk38vXtTCdhIVX2Nyqsgz+7cUlsXXX/A7ThaT8a7ySQbwSEJn4YI1mDfQH
         gbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771446941; x=1772051741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5flrAL4sVMxy9dAxCRRk+4HVhFBypoFV9t7l60ETjW8=;
        b=rkOj5ls0t6/G05uvPPviTdfd2X6Bb2E0n/1a12hsvNecerhhW/brPHjGlg2NqE9+9g
         9wbeXc5QroMCwLpcoduUXmWO1rnSQEKoZ7Bd5eyYcOq4A7VKVRS/UgclpYJIYK0w9u7v
         tyz6VJMNgja5QzTpwqNy0//ZQCCNitf4wih2pD6XYzZ5404+5IYwlhFhPcMynq3kQOEk
         s+WrNi+cuq4SReToyMPZxkaiy9I74EfQbceE25MDyoN5NJmLzSctAYU2TpBidWFXIP3W
         cnejeNaY5+jjCiNHe7cavVCGO7SRLf8OlFmhKor//H203USTRypU8k8srjTltrFn6Hkq
         IniQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJJKXjMRvy1BKrjhN7xnbg0igVk/1FZ9byD9bCFw4h8DUJRjPd5aR0aWz6bNdWJhJgYPFvJOnHk90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8Rn1c27zeoFYkEP1VCeoi9BWZ5fqPNrpAnHmOyGMcfHw8xd3M
	sDNQ/NrsgDoZk/r/Y7GT0jnOrJN6zNmfilRQkqZD1F6QmYMp3Z5/6IA0Z4cVqJuyRaTmLzgz4pR
	U0BoCI1ObSS6KN6Zcx54En261gmQvECt2jjEx+yki
X-Gm-Gg: AZuq6aKrnB5zGb+6bAfsFARs5h7X3gz0ruT4eiD2MUmeXv3PKgDj6RRbehnusyGMpZ+
	uibjR5zwPFV5kdi3wKPjrshFdP+GByg0QOIE7g15nIANe2iycJgppejH5DZvtcj4SWfOA9wdC21
	ISAtRl5wJ4/6CmDCidMqyQV82AJ1D+4WaW8JRX/9E8KW2ho/BrvkH+p9hEh+UV/0FiP7b+VWFCn
	CnIixHdMT+09kNtqNuHnVwN+zN1YiGbRYcSReGUPWgL6Lei16n3gFOMn4hDcv+knLWRnlb0jdBH
	teaIfd9VLavVU27HSeyxe5tCxiUjQnEm85dO
X-Received: by 2002:a05:6870:b0f3:b0:409:4a88:aa53 with SMTP id
 586e51a60fabf-41528f93d30mr1728217fac.13.1771446940936; Wed, 18 Feb 2026
 12:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 18 Feb 2026 12:35:04 -0800
X-Gm-Features: AaiRm53j3USRDpuUJlpXMQvbf-5aLWwT0Zdkg9mMtSdu-Mbpl8gGfwWEjVfnmIw
Message-ID: <CAPTae5Kyaems-3HEGQ8hhgkiRVPJgjecGCHQ4iRF242k+L_d8A@mail.gmail.com>
Subject: Re: [PATCH] USB: typec: tcpci: Make tcpci_pm_ops variable static
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33444-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[badhri@google.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6B489159795
X-Rspamd-Action: no action

On Mon, Feb 16, 2026 at 3:04=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> File-scope 'tcpci_pm_ops' is not used outside of this unit, so make it
> static to silence sparse warning:
>
>   tcpm/tcpci.c:1002:1: warning: symbol 'tcpci_pm_ops' was not declared. S=
hould it be static?
>

Thanks for sending the patch Krzysztof !
Can you also please add "Fixes:" and "Cc: stable@vger.kernel.org" ?

Thanks,
Badhri

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpc=
i.c
> index 2a951c585e92..8b7e6eb92ca2 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -999,7 +999,7 @@ static int tcpci_resume(struct device *dev)
>         return ret;
>  }
>
> -DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(tcpci_pm_ops, tcpci_suspend, tcpci_resum=
e);
>
>  static const struct i2c_device_id tcpci_id[] =3D {
>         { "tcpci" },
> --
> 2.51.0
>

