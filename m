Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD1A2C234F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Sep 2019 16:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731767AbfI3ObH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Sep 2019 10:31:07 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:46553 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730378AbfI3ObG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Sep 2019 10:31:06 -0400
Received: by mail-lj1-f194.google.com with SMTP id d1so9695388ljl.13
        for <linux-usb@vger.kernel.org>; Mon, 30 Sep 2019 07:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zBL7epC00p9U9++zGccJDAwUuYYIfHYJAHuYq0NGhKI=;
        b=Ke+Nx55iXZQfZSHRoqDLY786VnrQjJgoe/GD/uOlYu8+tDQ9EAUgLcqHGlUm6BTKpb
         WX5654MwqqZ+4GZEY92XR6gll89SPNvhOQD60cXDcMBMQxuvCBnI/oi+9OcSMb9YhvVR
         U2f3yCuw6i91i3dKrEsYVFk1FGdpYawZKGy0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zBL7epC00p9U9++zGccJDAwUuYYIfHYJAHuYq0NGhKI=;
        b=j6Dmi79wYpFo3GeYn/ABB+mVCON7e4V7bu8MdXwc82E4o1oGe29s4QGgsPBD6Kh6wL
         oB93buhC1b9GTqNOuq1mwTpAP1KdhIqfqOHfjIEZ1YlDR+j9QtfDnJMBweEhAY71oh/p
         CD9uSMzL7IGEVW56gQQu07xOaUCZAxyecY53SYFzv8DigzSCY2FUmlXP94SViRLkaQBa
         kOSp8Kb0+ZcgEWle9uxeU8a+WDDjXWuElT3lC7/9qAlaLdBDDU8f9mHOEdfchI+2yRvh
         XapFs0sQlpJT3+j4OktKQC0GdkT0QHscVpu8Fy8e5hvyjXhAP26YHhYD/91wormbPTiK
         MCOQ==
X-Gm-Message-State: APjAAAUGeIhZ1LLg/Ha6QkgUSQy/wSaGgVByqBHpdpMqr/C9cVg8PL/1
        wyHr83xd1KKV94daF1WA/C+VEQ==
X-Google-Smtp-Source: APXvYqyIcLy55HB3x/wsB1A7V+gCME1VE6tR84DBLqOOAZkx1QX/h9HdcAKeuQHRVXy8LcRSx7k+/A==
X-Received: by 2002:a2e:8ec6:: with SMTP id e6mr12257813ljl.231.1569853864490;
        Mon, 30 Sep 2019 07:31:04 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
        by smtp.gmail.com with ESMTPSA id q11sm3301932lje.52.2019.09.30.07.31.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 07:31:03 -0700 (PDT)
Subject: Re: [PATCH v2] lib/string-choice: add yesno(), onoff(),
 enableddisabled(), plural() helpers
To:     Jani Nikula <jani.nikula@intel.com>, linux-kernel@vger.kernel.org
Cc:     Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        intel-gfx@lists.freedesktop.org,
        Vishal Kulkarni <vishal@chelsio.com>, netdev@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Julia Lawall <julia.lawall@lip6.fr>
References: <20190930141842.15075-1-jani.nikula@intel.com>
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <8e697984-03b5-44f3-304e-42d303724eaa@rasmusvillemoes.dk>
Date:   Mon, 30 Sep 2019 16:31:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930141842.15075-1-jani.nikula@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 30/09/2019 16.18, Jani Nikula wrote:
> The kernel has plenty of ternary operators to choose between constant
> strings, such as condition ? "yes" : "no", as well as value == 1 ? "" :
> "s":
> 
> 
> ---
> 
> v2: add string-choice.[ch] to not clutter kernel.h and to actually save
> space on string constants.
> 
> +EXPORT_SYMBOL(enableddisabled);
> +
> +const char *plural(long v)
> +{
> +	return v == 1 ? "" : "s";
> +}
> +EXPORT_SYMBOL(plural);
> 


Say what? I'll bet you a beer that this is a net loss: You're adding
hundreds of bytes of export symbol overhead, plus forcing gcc to emit
actual calls at the call sites, with all the register saving/restoring
that implies.

Please just do this as static inlines. As I said, the linker is
perfectly capable of merging string literals across translation units
(but of course not between vmlinux and modules), so any built-in code
that uses those helpers (or open-codes them, doesn't matter) will
automatically share those literals.

Rasmus

