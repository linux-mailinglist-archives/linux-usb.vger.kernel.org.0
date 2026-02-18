Return-Path: <linux-usb+bounces-33448-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qWrlG5kslmmNbwIAu9opvQ
	(envelope-from <linux-usb+bounces-33448-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:18:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC00159D09
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 22:18:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7D8E030069AD
	for <lists+linux-usb@lfdr.de>; Wed, 18 Feb 2026 21:18:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2148326D4B;
	Wed, 18 Feb 2026 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tRRbKSpw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E4D30ACE5
	for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 21:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771449489; cv=pass; b=j5H2p2Trfer7hP062iZsBkV0KH6LQDMkjymXONReEmsHmPRMlrKpSVQFLiDYyTxCXhWNsX4scFjM+7SRab5/560TKWdHW7HZcajO1K7zrLlrKSFcSFnHQtPe6oLZLHPU+SgZgrvPxc9z7SMK5Aa3RDY5zSqFR2mSDdvUQYWmH+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771449489; c=relaxed/simple;
	bh=fsYG44fwuLfhCqILLKxnxhFO0yW0zeTrjXbuPgDnG60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1Z0IuVka9DanuEiT+id4mDRakfqC/AF1+LNIDlCpAoVd5LzgQVF1ucfD5pNZbjQm0X086PRXf3g+3hBarTh56gDb7/LVLV5+k3yqkfNW0KQXBSKps2uF3N+/5/Fl7vOJaB0OnnfM2yrM/mbwtRsvt28uOso9BRiFFTV7ITmDqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tRRbKSpw; arc=pass smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-40429b1d8baso89735fac.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Feb 2026 13:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771449487; cv=none;
        d=google.com; s=arc-20240605;
        b=cDdGjsGhbcnff+mxi5easjDk7oBcO1nS5q2AGaardJXthYMRNNWmrtpjSTXAPVx5PV
         SZuXneig5W7o6OI1JwUWpdYLob5HNmPeJJQEaY9u2zCdRqZC+Q45TnTfKbF+wnGEnpT4
         mS3evNH9/IuKP2XQq/koXa7dUvNI9KKB6/6R4f5THxPk6MHxQPQP1zq2TdMEVl+XDlu0
         pZMfbwuMoI5djh3AF0Y7MhFZsKzqNGGh8/V1Y4CSNqL9zJZ2Ro4B27r1F03aCZu0JjYx
         5ZFlhOVRC0CGsEzcf8OmFtJFZAJqByTcDxCTX5coXq6PW/7qq/C9FFMsLMuz0HonEonu
         4bdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J6gr/ySVDQofa57xnPEfvrjmR+2XTIhniQsbCQDB50I=;
        fh=vwXNDjdYmmcos4mNre7Venl2JvACjVxKHJBJnWGEAfQ=;
        b=hEhcxnXsMaDtNC5CkLCMzJY+EO2ptT6NaEYICgrP7u5QbkqOC9uwCpUseZhCvmou6J
         ixny2aOXDxagNK+xiI+i9grNZxYBRWZGyeOOlz5NRmXEDWLaFzg+peSKRhFFJarqsC12
         2w9106TJYS2s6Id7ubzip1RqZaGO73taVvMUaF52X1z5VR7c3Qmm9XjzWg5Ax6F7qRxm
         JOHP/btX8BysLWpmX8e6OybP/cchz0Jd1MfyOeeT8V4XBNL/Ic2PeYiKbV3Y3cNIcecH
         HxNdvZ9YAhvRC4sAPTSPz9OyncAc1YxxD9Z3Vhg9xvaxqeSxpK6i0W1E0tfPH/P6siSv
         lFFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771449487; x=1772054287; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6gr/ySVDQofa57xnPEfvrjmR+2XTIhniQsbCQDB50I=;
        b=tRRbKSpwvAJGFR+UpMIbYlT0TFnTsUOK4/lO//Iua3ka0/wFVAq6draeM8N6sPC2io
         OvOJllUWoBKIbS6oYTTWTbJqFV+YsrxLwGDrgs1Gwpjb0Z9UmJu3gr2zS3nvAKsZCpE3
         H/UKPZcE7k92mL8CSxjKNlzOCoRjNRirh1iJh6sJl7SPd//M8MyJC3H8+FKtbinDLWBz
         agt5UmZsfmd2wIUoQnyfLAnMJNa7uAPemf3cUeCW5Qqg4OhPBBIftimyFrCwTwMvb+Ix
         Ado4nHWBlHntd01dFmzXl5I4ZN+V1LJ8eAQcQ0gD/aKDfSxWdY4J03/V3UK4jlIizeaF
         xWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771449487; x=1772054287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J6gr/ySVDQofa57xnPEfvrjmR+2XTIhniQsbCQDB50I=;
        b=Vopca9qg4JmCGzZkl7YzlToLh1+wVnbKC2uWfbv/CcFYKdM0owf//0NwpFyA56VWeg
         ZssZxiRa+Y9X4E1cGZpR40tOtAhRe3NEGvtxWhVGJo7WvFLpeDo8FmPURF3KHkVQWc9n
         DasSrGk6glJnGDC6oPf5jHzJHXihdazIEYnqwke0KBEWym4wR/1yTiI7YIzYlAfZXMtu
         1i2IDzpYbX12yIox98EPN0rVqktS0PevAwywGkomiU3AN6j4EaAmVsXnuxRhIedt/LEs
         sWzCFABGid1unEqNmB0d6FalSm0MGxJDfP+u7XI6wPzOuvrkod9UrZAUA4yjOApsJq/0
         pVnQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/VQlFkEKrbyOdhhmTCtVcaZ85V5Kr99Q07jPvTmHC/E3bYhEG80rmHrHYLEPqs/CFjlPrfU5RQB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuUbzQLvqxPv4bZ7IkucAsS4QC1/P432tT5yogpYEqG3fOpPg/
	vz/QUEb9CldDz1gmcxzZGpgo0jypanv4j+jbnE5TGPysqJx4/A20/Rk7H9MmiYFPDsciI2xRhKt
	Cp9WxuwgyDzJluQJs71spnW9IauOHWb3XmgiLU0NE
X-Gm-Gg: AZuq6aIdF6pFzrzfYY6M2bVvAO53eb36VIYrZ5fuNLJZD0SLLvITR5kOyxV4Im9e405
	gyMiKG+fyWCNhonGsWqZo2uyiURowIowradww/vxI4Q6KMEDQjbhCG8s+5gYRPAP0obY8L4QPRl
	6F5h/AV17BR2ozNoHEFGIsgIdWYdLgyjDoYtlxbN7HKPNmN7O9FbW3wRH50TfgclFBLj9sOH5Lw
	HcAt17V3ikZAn4Cck0jmQBizEPK0YHUbrZbQ9sis9+cA0zGUKoIXMezbqLLYZF5ZgdswrGIK+zi
	WAv2BwC1nDxh1altNb2yQNlGf7OurU+/iBNO
X-Received: by 2002:a05:6871:72a:b0:40e:df4d:9111 with SMTP id
 586e51a60fabf-40ef3c5edaemr10174878fac.26.1771449486468; Wed, 18 Feb 2026
 13:18:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216110403.159945-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Badhri Jagan Sridharan <badhri@google.com>
Date: Wed, 18 Feb 2026 13:17:30 -0800
X-Gm-Features: AaiRm50m85nEiTq2uNxCdri94K7WSnR8saekBk7cg1Wo8QAjUf7fKidJHW-h1TM
Message-ID: <CAPTae5+5tjJBzfojOkTzqaj_i+Xtfc__DZtA41NzRQTR3aS3CQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33448-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8BC00159D09
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
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>

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

