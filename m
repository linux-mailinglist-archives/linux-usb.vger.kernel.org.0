Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6EEE3A880B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 19:49:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhFORs0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 13:48:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbhFORsZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Jun 2021 13:48:25 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C794C06175F
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 10:46:20 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id 68so10286830vsu.6
        for <linux-usb@vger.kernel.org>; Tue, 15 Jun 2021 10:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nyGASXjZK6+KaCFSY7M57pQho7eXR3tu7GtXUlEdjrI=;
        b=L/qX46GD8snGzvccBZlifarMswFYhBDW1qSLHsFffckOgg/GzJ9C1qZ2SlxXCnbF3n
         aCAGRoAuHyruQsWR0hf0CwR9tUuPFMOuIOc+X6R32nl1hJrf9gNNSXI2ldriRak6CcrA
         ldORFDeCc5ect6ffiKNvx9xS24m4v2ncV6hULVja935vO1q0otxWMuI+fWY4nDaRA/65
         ANfSnKLKO1CMeop3L99hLm59yObrVS/8nneMIFyxD1pNveTGvr2PE04sXtzo8p7+Kwaa
         i9D9H4ugxuTV9VBZ+e3jDKSfzGDXVrVFZTt8xJQFzxwyFfYwB4V5u9Mlv71Hq0pQQvj7
         uo0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nyGASXjZK6+KaCFSY7M57pQho7eXR3tu7GtXUlEdjrI=;
        b=i2TXnU+hirP6vTA9ngguQgAMIxki+/Eo/wGTRxo5Im5/qZ9LhhXCgZOH4+Rg6HoJDa
         2gkPGgslpqNsGHO4mfvq3z4MgwQWhT4pk2MpPBTK5LiOA3FmepaV64UwY20X+63TJRzs
         fHoWr1wfbfIkJk8HiaaDWjS9RY/+6teIZX9mo0WZ3wuyl3wcqtkHr2P/u3KUEdZGU4wH
         7tXmq590TQ5fLCQ7aBcWDVHJQpIxoNSJj4OEVtJvmQJ1ZEtY23L3AY8TZv21AcdNRrTn
         LgNjVAL5rUzpXD0TTe66kfEqbu9vAQqHrGYyNQg1v0PQFd7ENfIOmztHGggRT9r0+qMN
         UJVg==
X-Gm-Message-State: AOAM532NyloHt9A98ZSUAOs0jNpiI2Aa3hWWeew/veqjvWpn6Q9Eo+lc
        BjgguAZJFk7nQQRhdDX3fwk1gMOZ0GI6MGBcRib5YQ==
X-Google-Smtp-Source: ABdhPJxAHcDuOVlus4gjMRwSFbeAYLv4eiEq85ZPvI766hdWcE2C0hfBadGUAp2NzI/VRs4/2rcp1fFkxQfkI1hZ3OA=
X-Received: by 2002:a67:df93:: with SMTP id x19mr6894195vsk.49.1623779179091;
 Tue, 15 Jun 2021 10:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210615173206.1646477-1-kyletso@google.com>
In-Reply-To: <20210615173206.1646477-1-kyletso@google.com>
From:   Badhri Jagan Sridharan <badhri@google.com>
Date:   Tue, 15 Jun 2021 10:45:42 -0700
Message-ID: <CAPTae5KaCiXEOdNY-Ct3a0uaCDd8onmtM_bSaGzy0fkooJMC1g@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tcpm: Ignore Vsafe0v in PR_SWAP_SNK_SRC_SOURCE_ON
 state
To:     Kyle Tso <kyletso@google.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 15, 2021 at 10:32 AM Kyle Tso <kyletso@google.com> wrote:
>
> In PR_SWAP_SNK_SRC_SOURCE_ON state, Vsafe0v is expected as well so do
> nothing here to avoid state machine going into SNK_UNATTACHED.
>
> Fixes: 28b43d3d746b ("usb: typec: tcpm: Introduce vsafe0v for vbus")
> Signed-off-by: Kyle Tso <kyletso@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
> ---
>  drivers/usb/typec/tcpm/tcpm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 197556038ba4..e11e9227107d 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -5212,6 +5212,7 @@ static void _tcpm_pd_vbus_vsafe0v(struct tcpm_port *port)
>                 }
>                 break;
>         case PR_SWAP_SNK_SRC_SINK_OFF:
> +       case PR_SWAP_SNK_SRC_SOURCE_ON:
>                 /* Do nothing, vsafe0v is expected during transition */
>                 break;
>         default:
> --
> 2.32.0.272.g935e593368-goog
>
