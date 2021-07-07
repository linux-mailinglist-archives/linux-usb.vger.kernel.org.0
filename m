Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06223BE40D
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jul 2021 09:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbhGGH7l (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Jul 2021 03:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhGGH7l (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jul 2021 03:59:41 -0400
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAEF4C061574
        for <linux-usb@vger.kernel.org>; Wed,  7 Jul 2021 00:57:00 -0700 (PDT)
Received: by mail-io1-xd2a.google.com with SMTP id k16so1852513ios.10
        for <linux-usb@vger.kernel.org>; Wed, 07 Jul 2021 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=RuB3YcAZ762de74BPx2iBW+XcUdmY1VMsNNjiwv2RiU=;
        b=dUsl56+5XStmIvWTWNld4wdh0M5tL2AefThRJd/vwow+vnbm78mLTFeV+OlZGaVHim
         EcJ/2eZBuxsKp36W8N2ldQp1vNQxCuPGxO3vjBvLpSK8C0AMj9mk2h9bzNWM1uZDOECt
         U5OB7QAf9DO5RyO4Jz4/vA8GsoAhtaBoY/IIJDmNL/5XIM082UMkGAlvNXclZAEd5b+u
         u+D3qXOPy10R7FJaLUm8hiaOKNcG9Nae1Yw+7ozCkMcM1gmDNJgmtw28pgC81LqdelK/
         +tND+EmdeDc3eUla8z51MKCvtpsEGq21LfTmnLgDQixX7JWJ1NMWEzgvbLrW3YmBblsd
         uZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=RuB3YcAZ762de74BPx2iBW+XcUdmY1VMsNNjiwv2RiU=;
        b=qljKcLWbfLpAwd9a553pUw4dNMUjsyXR9JBePq/b8m5OMSpQAGR5HtQT4fs+YqFIm3
         RzqQ/4UxTLWh/3UJljPveJU3vg/8eiprWF31hCQfkWn+aHGYt/xZy0oG3ce0JNuZd+gi
         YV0yXjq5aCuPvpeQ1V1DLsbK6ZchP6r7gR1RQjfvOSmq0JvuOnLhsC0YePFKIFq4AIuM
         IVH/wt15laOUr8V8n7NAMwzpaGM7yXtWtBMj4/bznUXZm2Mxh2vlvEjiYj5sAa6Y4KMt
         8YGLAOFAz0G4nlw/RGJLITRX/2ZSVHC4h5syL4zvs0i3ROUFkfqdu0kI8WfdFqHsmcT+
         zjCg==
X-Gm-Message-State: AOAM531jJqeIRn5yGL/wHIGwNOo0i57tTf3a7dVExMY6ZWXInu6hLwig
        u66WOUuqYJEfHKLsyiAoH54DQhFB2RV2LuNPNbU=
X-Google-Smtp-Source: ABdhPJyqRi/Nh8Ab1KAAblBNpuryoEeGRlNn0kwmuztoBrhCOuuuS3bY8ot2i2G7u0eq8c6Y5ZcJgpjEQ/Rjf3Gz+1s=
X-Received: by 2002:a05:6638:2612:: with SMTP id m18mr20803632jat.54.1625644620239;
 Wed, 07 Jul 2021 00:57:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAH8yC8=9arZhsPruxMmT+NL65=-YB57Mzg0fVfRdjMy5bmBbdg@mail.gmail.com>
 <YOVapvO9N8FhsIUC@kroah.com>
In-Reply-To: <YOVapvO9N8FhsIUC@kroah.com>
Reply-To: noloader@gmail.com
From:   Jeffrey Walton <noloader@gmail.com>
Date:   Wed, 7 Jul 2021 03:56:10 -0400
Message-ID: <CAH8yC8nUZCSnnZQaS6g44=5X7pzvTr6i0pE2VzSr11EeCtpBoQ@mail.gmail.com>
Subject: Re: CH341 driver and the 5.4 kernel
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > Does anyone know if the fixes and improvements for the CH341 have made
> > their way into the 5.4 kernel?
>
> What specific commit are you looking for?

Well, I'm not really looking for a specific commit. I'm just trying to
verify the various fixes are present in the kernel.

> And if you want to use this device, why not use a much more modern
> kernel release?  5.4 is quite old for new hardware to be using, does
> 5.13 work properly for you?

My bad, I thought 5.4 was a LTS kernel. The docs I read said it was
released November 2019 and supported until 2026.

I'll try something newer. It looks like these are available:

    5.4.0, 5.6.0, 5.8.0, 5.10.0, 5.11.0

Jeff
