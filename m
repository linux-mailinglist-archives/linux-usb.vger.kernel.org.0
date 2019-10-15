Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0FE8D837E
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 00:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbfJOWVG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Oct 2019 18:21:06 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35138 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbfJOWVG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Oct 2019 18:21:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id m7so21894737lji.2
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 15:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=igJfeABa6M5mmcDSZ9XAWyfxDlpeT34TBKS5Vu4WYQ8=;
        b=LIYdbK/WEFGMNdD+uIGw2BasCdPDikOSk/1C31c/6KJAoWeweWvBbkEnJF4PHN8TkH
         BgZdUCf/ZYXj115hlOqd/koyMkdZG6Il9yGalmukOiV4kTIOYCVZSlLQpLqR2NWtyVYg
         nGZ/n1OZmV0DBw+aQ4pzCSwYlzFEdDM+SUZEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=igJfeABa6M5mmcDSZ9XAWyfxDlpeT34TBKS5Vu4WYQ8=;
        b=TV8s5k/Ttm85nlyfxi1t9SFlTvYfYMtpzx/SpAQUI1Rip0+wkl1Vhd1KNc64XIOog4
         QXcK07/vBcNUiueQRTBOaJmDvj9emGm3Gk0kMVtkYHQ44aVAh4esnZpMcopTAiURj9WK
         VQnQALpfrpLzfUTkGZCdj5c0y/I6byjOrt5gSivE/Cl4zHIo4Iu0rPSf8AUeip63kCgh
         ExCYtNthQef1PdNQvpqa43UcIbgo5ClKUPM0NbLDr/kpTIFSXpE+rvy+LByeq/c4mjIs
         HTwkA2C2pV7JpccB5XbVR67zqnDeAGlxniVunPZVEJCb4OF0HglV0mnduLCZtzpzRyiB
         gX+w==
X-Gm-Message-State: APjAAAW4IFi7Arsj7EkfAtgcp7NlzZTJx8zpWeTAvhJ424iBOB5STq6o
        xhTp9eLTBQcT5E6y0mzjG9/O1zPWNs0=
X-Google-Smtp-Source: APXvYqzcIPKMwlyoGrG857nGp95sht7GWuFTmXZdgqjyK5Iv60ek8n5KPOTyLPhXhZ77v/qnKiE/pQ==
X-Received: by 2002:a05:651c:1ae:: with SMTP id c14mr22539422ljn.135.1571178064110;
        Tue, 15 Oct 2019 15:21:04 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id q13sm5373611lfk.51.2019.10.15.15.21.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2019 15:21:03 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id c195so15723008lfg.9
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2019 15:21:03 -0700 (PDT)
X-Received: by 2002:ac2:43a8:: with SMTP id t8mr22573654lfl.134.1571178063150;
 Tue, 15 Oct 2019 15:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <157117606853.15019.15459271147790470307.stgit@warthog.procyon.org.uk>
 <157117614109.15019.15677943675625422728.stgit@warthog.procyon.org.uk>
In-Reply-To: <157117614109.15019.15677943675625422728.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 15 Oct 2019 15:20:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivjB8Va7K_eK_fx+Z1vpbJ82DW=eVfyP33ZDusaK44EA@mail.gmail.com>
Message-ID: <CAHk-=wivjB8Va7K_eK_fx+Z1vpbJ82DW=eVfyP33ZDusaK44EA@mail.gmail.com>
Subject: Re: [RFC PATCH 08/21] pipe: Check for ring full inside of the
 spinlock in pipe_write()
To:     David Howells <dhowells@redhat.com>
Cc:     Casey Schaufler <casey@schaufler-ca.com>,
        Stephen Smalley <sds@tycho.nsa.gov>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 15, 2019 at 2:49 PM David Howells <dhowells@redhat.com> wrote:
>
> +                       if (head - pipe->tail == buffers) {

Can we just have helper inline functions for these things?

You describe them in the commit message of 03/21 (good), but it would
be even better if the code was just self-describing..

           Linus
