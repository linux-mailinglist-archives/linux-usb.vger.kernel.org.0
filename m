Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E43E1E62CD
	for <lists+linux-usb@lfdr.de>; Thu, 28 May 2020 15:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390693AbgE1Nvf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 May 2020 09:51:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390687AbgE1Nvd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 May 2020 09:51:33 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A25C05BD1E
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 06:51:33 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id w188so6760962vkf.0
        for <linux-usb@vger.kernel.org>; Thu, 28 May 2020 06:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Owau2ya3gC/56f2SKOWlhU4477LIjpRkozc6MVc36Qc=;
        b=GYmzIcOlqp0inV6/3Xbibkn3HMcVd4Kh3aWqiEsZZ+94U0XoqmKQnXEFW911vZoxe3
         tqwoC6vF9M01gE2dXUFrB+Ljfs9ALNwtqNC9lI8jyrz87h2pALKsg8cK2UUsJEFMMJ0r
         M3FtrtYW8asIwRfRjJAX4rJxdX5w5qBpjn8NA7VeL7Tp/dvhsVFNkGMcLkvXRq+e49nF
         LNFuGTCOJxOrHz3Ow2ouJpNFYbVUHcOSDg4F7DPUUSS/+Mz65uYZTDTXTbRBiPsWJcL6
         K3ch5G5007j8ORpqaJGFm3zvzMVfY69UTTqQoNyWodKbgqaCJ18Vly1x03KxSkVv8f2W
         oKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Owau2ya3gC/56f2SKOWlhU4477LIjpRkozc6MVc36Qc=;
        b=WPyqXl6JmaakN7SouBphD313AF6UokA4bvOEuOuA5gT9lcwqgq+sw9r1Y6fUWLh0si
         PwX9QrFjgbHAxyy/5JMMnvZGwfhcMmTzst49lLczspv0a6jvjWidwmev9soMsa5wcNJ1
         pjmyVALbezNkbswOPFyA27IKl+D8JJxfaj7r1IN1QU9zWlqw0JhEJDSDbzVGWgOYw186
         9AlAkY0LqLahj1m+BJLietSd0Z/X+QUXINW+d2/Ih1Zb1wKQ3RAHrEXs1gi3nmvGcW5s
         rzJ+cJVoxljy545ApUIwMY4O2MmY7AvpH/9ddiUaEij3jJfU2tnGPBud0DY8Ho75+2Zc
         j6HQ==
X-Gm-Message-State: AOAM532o/TUOKXZ0cSH+UqQsp2tW8l6nIITevTvViOlXubQ+nsAlCxlG
        lVlwIra4RFSSfmi3sOfe6qjFG9iZmpecDdOoEmk=
X-Google-Smtp-Source: ABdhPJz9rpEV9NefPJ4mvmUlFFoe/xH96S5Z/teq9tsa7Ud4tKk4G1rL0ay4Q3TiP/U4WG82nA4Rv2OPTseHsC+Qrrs=
X-Received: by 2002:a1f:9094:: with SMTP id s142mr2205245vkd.6.1590673892337;
 Thu, 28 May 2020 06:51:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200509141619.32970-1-noralf@tronnes.org> <20200509141619.32970-4-noralf@tronnes.org>
In-Reply-To: <20200509141619.32970-4-noralf@tronnes.org>
From:   Emil Velikov <emil.l.velikov@gmail.com>
Date:   Thu, 28 May 2020 14:48:24 +0100
Message-ID: <CACvgo51Cq1ipV_K-NLk9QZ7d1Pweebz2ST6anqrT1q09r0+QEw@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] drm/client: Add drm_client_framebuffer_flush()
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        linux-usb@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi all,

I realise this has landed, so a small FYI comment.

On Sat, 9 May 2020 at 15:16, Noralf Tr=C3=B8nnes <noralf@tronnes.org> wrote=
:

> +int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, struc=
t drm_rect *rect)
> +{
> +       if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)

Hmm cannot think of a good reason why anyone would call this with
!buffer || !buffer->fb?
Might be a good idea to WARN in those cases - otherwise the user is
given false sense to security.

Looking at the upcoming user (drm/gud) it already has both - so it's
perfectly safe.

-Emil
