Return-Path: <linux-usb+bounces-33488-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gl7rFDTyl2n6+QIAu9opvQ
	(envelope-from <linux-usb+bounces-33488-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 06:33:40 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4048164C3F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 06:33:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D9DAD30078BD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 05:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB50253340;
	Fri, 20 Feb 2026 05:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3L0haNw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA763C465
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 05:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771565616; cv=pass; b=loOtgjkrOxXaXL/ImxGwDtvRIYqSFYLrJmYd5Q56B2XPe9mdCzkGZH+t37Fi0gaafOqym5jQnp/mHdP5qgmoJWsFSe3ioKnOCL/k1Fl7YcaDkbv6lap3M4iQo/smNLf7pygskUK3+qmOPlel9MgFlC+kQYphBfC9+hEBD2nc+mM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771565616; c=relaxed/simple;
	bh=H4YwKhOLb26W1m9whElA1WQwPzx5Ic1Q7r/E5ltZZ+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGfVHASrpepxvIt8uKGZwu2CabolJsj1425uIzShEvjj2zy3kPhR0gVMsr2Yv1/9xBFb8zzMzFcG8RWenstJNTwFERfMWljpUQpGjlj4O2b4bPa1tiTWPLQngaZAGWaCZUPGPJ28Ib7ZxVvnBnggZcGnwL4azovNA9iurchkiX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3L0haNw; arc=pass smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-566390e7db3so1655139e0c.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Feb 2026 21:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771565614; cv=none;
        d=google.com; s=arc-20240605;
        b=OS2N4M1LbrLfsyjnD8SHYrVSHcKtxtp9YE2MP9DEvnsksqbE730kJm+hj4hyfucFnO
         gHS5+hVtVR3npCsBdRAytYpwaRa0GoN3siFboEbbHjX5a/A4UAW61MeD0LFKL0VxS9LD
         pOTyd8gVen/+dzuie7R8BPscd/XxXFtrSGJePt0roY5uZJaFET05IceJD+gNnE/f1xS7
         SxRQlKHeQ9z+P6dfWEE8gA8Balio4PuX/CmtljxjEVxi5ANUxkk71xZyX2DbkvgX9S2a
         VeoPDLZ1kabEbBEBIQP4boZ+ia7kw+LthvW8eAI7AZAbqwO1/Mk9skns96Nyqq/gc931
         xpOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cl/v1bTlyW6IS1Z3lOSykMvdpRt02barr8JIo+yqNws=;
        fh=+B+MlfsB72tmYq6MZSgRE66vRgTuVRy8myv5tu2nkFQ=;
        b=ajdhT6U1BBeou3mjJBwZMtnu8edVKskEC/HPOkzJcLUutkpRuv/L1iPJzM4Z3y1WSe
         N10kbbJSWTnAhlQ02XWHq5b51KRtOTV2ozeyzjnktRdMaPLjWiOIvZcA8fr/k0DpJD+W
         7svkpLseEeOoYQbR94TDUxKQsGnN9aR4ZdMHJgXrwokk+JijkBE1GtE3dyg+6jhygo4/
         ez5ndrvgSLHVe8U+05dFssPhohk/9BLilTpoURslrRp43IT77rzpz6N7gKVPfhcWmszl
         De85YrQ2EN6ggj/AqJxUjFJzOJadzvLGW1EHIYJPZ8+DFzn0d4lozi0sar4XgwkgqD0J
         LLlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771565614; x=1772170414; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cl/v1bTlyW6IS1Z3lOSykMvdpRt02barr8JIo+yqNws=;
        b=I3L0haNwouu8XGq7LkiEYZvp94n2wc6jjWXJzG4luIQpjBweByIwDJ88Rka/is8r9h
         TFY0cPkTdcs1plXb0eCvFuXtC7WnnFTaPGKgHiZfHmM40FsUfogpphixLa87XTK5+Bsc
         wBMALUJtO6dS7KPiz7isN4CMsKnTCoDFtUeriZvY8NAVhdLUZiavVrqBc5EVhzvrlGQJ
         gRGQYTJLxjqNvKwV+uYVfSfwLfeTq3cCykQPnu3v4w7PJbybOTCAqSvvGBBQvC90/Bk0
         doqgKtMQlF/MEgzijYykiURTWCj+FL3TaUKDYrtEJeTKTI380TQCXjt8dt2YKD6VsS/Z
         rY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771565614; x=1772170414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cl/v1bTlyW6IS1Z3lOSykMvdpRt02barr8JIo+yqNws=;
        b=oR5cGX696UynZFkegfpbTUJXVrRlKMWidStUj3buFvkf2tsOi/izZhwPbw9tyJN7BJ
         hK/hPUpQ2bp0njArF/7I7iwZo2AFitXIYrSLoJq7Vs+w13JnPxcG72e+5w7abHPNytFz
         q5L4/o3GE2bC5wTh+9yU6HNayQxw+WYKbahGdrm8jn01jyQeIg0/JNp9qCd2Fg6Unj18
         fdH/eUSQXPc9oTaKcl0b2V75VJn0IJ072zPZOXGLCrW3pofLa9RMUAHS/g2yljQzuSY7
         /Zyx/Va7dYaq3T7+OTq3Ti+dWsc7YKDGnXLcB96ROvqUBSbMm6PcHfz3bexk9Z7ySkq0
         c6Og==
X-Gm-Message-State: AOJu0YwLP2fE/Jm5y2fJmk7JMmbOQE+6KCvjVze6JIuvwgTfLoncUWm3
	BUp9X1+s7PmrAA0X4uP+QPJDm5nEMnp6PJbnLB7hWHC5+R71fmZ47dNRlruYixvITf8wKn40Fdw
	lO3QizNhvWwgL1+spMx4nX6nVIhS1ikI=
X-Gm-Gg: AZuq6aJrcyHdnRbs4uWEtlwY8h9/GP97Kw3E/sLI1NavmPzmStIHW9rTHc+n0QONKF2
	ry42W5wgiObHTXoFuur3XVgDfBREymmGnf8FY1kcGUiAHK7z6DhcBsl9JXGFOS6+Bxrra3rrpZP
	77IyquZTx50/fGurm0S4Ru1XeE0EO74rknUKTTTW5sqvwZbnqURnsSZjxTCyEcW9g14YTM9hLfp
	krrKZgLisDnbwQL0Hb6aFa/2olnXfy3IeExehdgubYM1LTSXlSwS92WjBW+qEHd/XNdniVwLqYQ
	5h1u56A=
X-Received: by 2002:a05:6102:38ca:b0:5fe:401:9d03 with SMTP id
 ada2fe7eead31-5fe7fca2399mr4249102137.25.1771565613955; Thu, 19 Feb 2026
 21:33:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219190251.3422-1-nathan.c.rebello@gmail.com>
In-Reply-To: <20260219190251.3422-1-nathan.c.rebello@gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Fri, 20 Feb 2026 13:33:21 +0800
X-Gm-Features: AaiRm50Pvnpq6_W5v5z1S-meMWcOHzQhqe2gEoLkXkR6JD6z9KrbDG9l8veV3JI
Message-ID: <CAH2e8h7XWYi7sXBs7zCxY56LfC34pffh-0cvX39OvwqRGHq0Eg@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: ucsi: add bounds check in gaokun_ucsi_handle_no_usb_event()
To: Nathan Rebello <nathan.c.rebello@gmail.com>
Cc: linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33488-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Queue-Id: D4048164C3F
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 3:03=E2=80=AFAM Nathan Rebello
<nathan.c.rebello@gmail.com> wrote:
>
> gaokun_ucsi_handle_no_usb_event() uses the index derived from the CCI
> connector number to access the ports array without bounds checking. The
> index comes from UCSI_CCI_CONNECTOR(cci) - 1, which can range from -1
> to 126, but the ports array is sized to num_ports (typically 2-4).
>

Generally, if there is a connector change, UCSI_CCI_CONNECTOR(cci)
will be greater than 0, UCSI_CCI_CONNECTOR(cci) - 1 will be the port
index. and it will always be >=3D 0. boundary checking is not needed.

NAK.

Best wishes,
Pengyu

> Other functions in the same driver validate the index before use
> (e.g. gaokun_ucsi_connector_status, gaokun_ucsi_handle_altmode), but
> this function was missed.
>
> Add a bounds check to prevent out-of-bounds array access.
>
> Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi dri=
ver")
> Signed-off-by: Nathan Rebello <nathan.c.rebello@gmail.com>
> ---
>  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/ty=
pec/ucsi/ucsi_huawei_gaokun.c
> index c5965656baba..9790296be0dd 100644
> --- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> @@ -349,6 +349,9 @@ static void gaokun_ucsi_handle_no_usb_event(struct ga=
okun_ucsi *uec, int idx)
>  {
>         struct gaokun_ucsi_port *port;
>
> +       if (idx < 0 || idx >=3D uec->num_ports)
> +               return;
> +
>         port =3D &uec->ports[idx];
>         if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
>                 dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT=
");
> --
> 2.43.0.windows.1
>

