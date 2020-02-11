Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75CF3158FCF
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2020 14:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729189AbgBKN0Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Feb 2020 08:26:24 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:44363 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729219AbgBKN0X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Feb 2020 08:26:23 -0500
Received: by mail-pl1-f194.google.com with SMTP id d9so4265028plo.11
        for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2020 05:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=r/EWQ6jzqVBzIo/X5bbiSGofAZqQ5V8LIm1aAkGM0z8=;
        b=F0vWVk6tLleuwbCwvrZRYRhq5cdWZTUH9fEQQgrF4uPkFnhw+Zb6L9wmXX6OQvJyj1
         GPHwFhuFYxICHMKg7I9pjk9dNN5Dr4onjhqC+5nYXpYZq7r5l9LGwrxIvmwf8bfqZTIZ
         HOlskxIG8vrD5peSyBUXUjYJDyjVdeUzfnvriyZ4VWRtJLVz+vAScRg4l3KlNxfa3UV9
         Gwg6VHrbVSDitlhOShJe1rdmEM+DfJz2IYkBY37QGW1lf9MisFSIwWyYvZgkQmp7pUOV
         pkOIoV+74MAQxbWQt1vBVRVF136kuEw+HqQGXUEa1kf386dcqfFF2MQmqo9BN9bZ8fiJ
         LKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r/EWQ6jzqVBzIo/X5bbiSGofAZqQ5V8LIm1aAkGM0z8=;
        b=W7reTLAOd57v485xEwWeBTC34WebL9jbPhdy9LYOIHvo0qXBLSFHmUSPBOw58Qyes8
         YL8ka+pboCusa85m+4qSVrtjmhDRKu5CwEyz9spsvKl7nl6F63N2oIbfKQnE3SsvXccd
         s3pPph02XokTMdt9NoR890wZGulRxp1f99hSc8sTqFBLgUnrKy0fU5960SZQy9pc+QY9
         epgLad6Fh5fFo7NITrx2I6SSjqHeIeI/XyFpk/+3UuOFbBgl3oYVCy3DIK1bTiBTqnzF
         Z9hJOe2n4pRvUG5XNv0NvzjQnKr+CVoWcc69MUotyab4ABmkcumBXf7+nPNYnbdomU3O
         wqKw==
X-Gm-Message-State: APjAAAV7m4i42OV0MLFsVJGh5yPyyMTV+DQriKveQNV+fy2eC3XsneOm
        cJqmAmyaBBw8T/HLV5r6KpA=
X-Google-Smtp-Source: APXvYqxyQ7IASGLk0eDrGniK3STXhwaVOpkGpIayrI8Guu8c3mEdu3XUIqQ6a0kywLMHNxPWMnQPSw==
X-Received: by 2002:a17:902:bb93:: with SMTP id m19mr3286501pls.310.1581427582994;
        Tue, 11 Feb 2020 05:26:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h62sm4268028pfg.95.2020.02.11.05.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2020 05:26:22 -0800 (PST)
Subject: Re: [PATCH] usb: dwc2: extend treatment for incomplete transfer
To:     Boris ARZUR <boris@konbu.org>
Cc:     linux-usb@vger.kernel.org,
        FelipeBalbi <felipe.balbi@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Minas Harutyunyan <hminas@synopsys.com>,
        William Wu <william.wu@rock-chips.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Douglas Anderson <dianders@chromium.org>
References: <20200210213906.GA24079@roeck-us.net>
 <20200211054953.GA2401@tungsten>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <4dfba534-ad32-f69c-3ea3-ab838e894bbf@roeck-us.net>
Date:   Tue, 11 Feb 2020 05:26:20 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211054953.GA2401@tungsten>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2/10/20 9:49 PM, Boris ARZUR wrote:
> Hello Guenter,
> 
>> In the meantime, can you by any chance test the attached patch ? It _might_
>> fix the problem, but it is a bit of a wild shot.
> I tried your patch, but the machine does not finish booting.
> 

Weird. Can you enable pstore ? That should work on this system. Then you would
have the log from the previous boot in /sys/fs/pstore/.

> 
> I would like to give you a dump, but the screen scrolls fast, and what's
> left when paused is not interesting. How do I get it to dump on disk?
> 
> My journalctl doesn't show anything. I have no kmesg.log anywhere.
> The first time around I was 0/ changing fonts 1/ trimming the dump message
> in the kernel 2/ filming my screen. That's not practical at all...
> 
> 
> I have been looking a bit at things. I believe that part of the issue
> is the need to re-align the buffer we get in the URB. I'm wondering if asking
> for a specific alignment when creating the URB could be doable.
> 
> 
> As a stop-gap, maybe doing things like in tegra ehci could fix our bug:
> https://github.com/torvalds/linux/blob/master/drivers/usb/host/ehci-tegra.c#L288
> i.e. having the old pointer before the new buffer instead of at the end of
> it.
> 
Yes, that was the original solution. Unfortunately it didn't really DMA-align
buffers, so the temporary pointer was moved to the end. It still doesn't guarantee
DMA alignment, though, so I am working on fixing that and moving the old pointer
back to the beginning.

> Now if something is overwriting the buffer end, that would also be hiding the
> issue... but if the bug is related to lengths that don't match between
> allocation and free, that could work. In this case, that would also be
> hiding the issue :)
> 
Yes, that is why moving the old pointer to the beginning won't be sufficient.

Either case, if the current patch causes a boot loop there is obviously something
wrong with it, or the fix is incomplete. I'll keep trying to get equipment
that lets me reproduce the problem.

Thanks for trying!

Guenter

> 
