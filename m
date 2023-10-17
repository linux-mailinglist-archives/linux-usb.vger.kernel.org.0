Return-Path: <linux-usb+bounces-1814-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B467CCF58
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 23:33:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B447B210F6
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 21:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5628B2F502;
	Tue, 17 Oct 2023 21:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UIEZEHvL"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3589A1F606
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 21:33:32 +0000 (UTC)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A69F9
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 14:33:30 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-77891c236fcso12302885a.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 14:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697578410; x=1698183210; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6zl+wSE/fz+ducMX6hYKgOCMYM8auRGMjne06mswZ8=;
        b=UIEZEHvL7hzh3w/bekKJLvI64FtN5/nnD2ZhZtfRKTzuzHqiEWa9YAkSW0o/t/9U9M
         WCqa4v4dGnZi+ZwpkRsDWGh/fiSQrsQDcqvSBBnJg6WAQOKuKW8td7XTAZxMKylUDijF
         qTlPo6ePleq8Ugdmctwax16vi4hy3djcIjKmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697578410; x=1698183210;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6zl+wSE/fz+ducMX6hYKgOCMYM8auRGMjne06mswZ8=;
        b=oF3kXKJluEtT3QlmLZrVedBapBfckvERjvdc/vUhhSg/FuXBVwwpiN6TUxXQy+hybX
         X8uBoKEpQmOTg66geJiyfiyrooYpFm1JF5ZgLA4Dzb2fc2s/7J17wH4lDmoz6Lzkkb2H
         CxvKbIvysBwz1/NUE8KuzQdciCei8vLlNmrTfo/45Dmex38SI3s/DBG4H4aLi7IlGN6m
         hgdKxn8aoOL3B9j2y9DRJ2jpwdbtc1lfmDVLe4JXWLtE6HdikQyMuL8T9rrdFmndu/SI
         NCRz6zu873dWuQ56Seoyt9wBYkGJBtzc+EzZSfk3WyA4KDDBsK0eQ/etPLDFsWO8AHon
         HTdg==
X-Gm-Message-State: AOJu0YxsX5Ibof0rypHh26Mp/ImFCDbXyMUxTarLQHT058WQBUYIBnfw
	B/k1FeSOyW/0HAGYqAFXdhptdu1kXnL9rF3/V9kYsQ==
X-Google-Smtp-Source: AGHT+IH8Ju4SHUrvi7DxIyMG1q3LZA6VMP0Ksgj6FYRzSOeuH/AGPBdUwfFnt4kIpk837MMVangLq1QoeOR7S2QqfFA=
X-Received: by 2002:a05:6214:2a47:b0:66d:6994:daed with SMTP id
 jf7-20020a0562142a4700b0066d6994daedmr4772001qvb.35.1697578409829; Tue, 17
 Oct 2023 14:33:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231016225617.3182108-2-rdbabiera@google.com>
In-Reply-To: <20231016225617.3182108-2-rdbabiera@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 17 Oct 2023 14:33:18 -0700
Message-ID: <CACeCKac2kknw2s7orH1tu4RsiCr5+WYy1VQ483ok_zuzC2N9zQ@mail.gmail.com>
Subject: Re: [PATCH v1] usb: typec: altmodes/displayport: verify compatible
 source/sink role combination
To: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi RD,

On Mon, Oct 16, 2023 at 3:56=E2=80=AFPM RD Babiera <rdbabiera@google.com> w=
rote:
>
> DisplayPort Alt Mode CTS test 10.3.8 states that both sides of the
> connection shall be compatible with one another such that the connection
> is not Source to Source or Sink to Sink.
>
> The DisplayPort driver currently checks for a compatible pin configuratio=
n
> that resolves into a source and sink combination. The CTS test is designe=
d
> to send a Discover Modes message that has a compatible pin configuration
> but advertises the same port capability as the device; the current check
> fails this.
>
> Verify that the port and port partner resolve into a valid source and sin=
k
> combination before checking for a compatible pin configuration.
>
> Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mo=
de")
> Cc: stable@vger.kernel.org
> Signed-off-by: RD Babiera <rdbabiera@google.com>
> ---
>  drivers/usb/typec/altmodes/displayport.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec=
/altmodes/displayport.c
> index 718da02036d8..3b35a6b8cb72 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -575,9 +575,18 @@ int dp_altmode_probe(struct typec_altmode *alt)
>         struct fwnode_handle *fwnode;
>         struct dp_altmode *dp;
>         int ret;
> +       int port_cap, partner_cap;

VDOs are 32-bit, so u32 is probably better here.

>
>         /* FIXME: Port can only be DFP_U. */
>
> +       /* Make sure that the port and partner can resolve into source an=
d sink */
> +       port_cap =3D DP_CAP_CAPABILITY(port->vdo);
> +       partner_cap =3D DP_CAP_CAPABILITY(alt->vdo);
> +       if (!((port_cap & DP_CAP_DFP_D) && (partner_cap & DP_CAP_UFP_D)) =
&&

nit: bitwise '&' has a higher precedence than logical '&&', so the
innermost parentheses shouldn't be necessary:

           if (!(port_cap & DP_CAP_DFP_D && partner_cap & DP_CAP_UFP_D) &&
               !(port_cap & DP_CAP_UFP_D && partner_cap & DP_CAP_DFP_D))
                   return -ENODEV;
                ...

OTOH, perhaps you should just introduce a macro that performs this
bitwise operation for even better
readability. Something like

#define DP_CAP_IS_DFP_D(_cap_)        (!!(DP_CAP_CAPABILITY(_cap_) &
DP_CAP_DFP_D))

(not sure if "!!" is tolerated in kernel style, but you get the gist...)


> +           !((port_cap & DP_CAP_UFP_D) && (partner_cap & DP_CAP_DFP_D)))=
 {
> +               return -ENODEV;

Single line if statements can drop curly braces [1]

Best regards,

-Prashant

[1] https://www.kernel.org/doc/html/v4.10/process/coding-style.html#placing=
-braces-and-spaces

