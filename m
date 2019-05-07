Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D561D16597
	for <lists+linux-usb@lfdr.de>; Tue,  7 May 2019 16:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726833AbfEGOXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 May 2019 10:23:11 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]:45362 "EHLO
        mail-wr1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726403AbfEGOXL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 May 2019 10:23:11 -0400
Received: by mail-wr1-f44.google.com with SMTP id s15so22593134wra.12
        for <linux-usb@vger.kernel.org>; Tue, 07 May 2019 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rquzBf4lfhdLXSfraBpTjP0kG9p+U2KMsl9RTwTM4K8=;
        b=WEnO637EjJSjSYeWhjoD2B9iIbOFswlKf5kVb1K6kvu891h8xnUt/iZ5HsJPDbss/5
         v7l02GC6kt/zLMSvrl4v8hW0B0ZlAuXr8+09VQtycTf6d12mYeVwOpNDATx3brSoA0fT
         8amDZ3gNxNBkj9E2qM7JgFmj0g+S4g4jpMdsbn+uRZjQtEfzvalJvuytwGq2TqODhiFN
         YzKl+Cti3T925LGmMTW9t4DsJgCVZwe9LrxZGFeUCyC/1T8TIQTk+vOFWpH/1EfTcIPg
         9vso/TcI1W9kkHKhytv6g5NCA97QAf64OP3WI8fyfN1zkr8XpLmR+k2V2ENOAlbMNhdx
         eNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rquzBf4lfhdLXSfraBpTjP0kG9p+U2KMsl9RTwTM4K8=;
        b=TnGh3fQdLygjvGwY6Z0PoIK1WS4A/wxP16qQycN7e1oDF/mS5Ip2eQWPQe538AjXT7
         rY+Mt+7V6ykQ6z+KJ6YquHNMznYMxgJEilJWeN9+5l9URNVOTQRHL1c/WdnbzoPDJIqP
         kthZF9kIRY251b674zg0ZOls4nmOVlqW2J9hMPBkt9KbqlGW5ASL76/rsTXi4aXKAoFa
         5p3TJKPJHaYftQPhTSbh0zJNfCNbkmza0rZ+Eo5ZTvP+FbPVz6Tzt2iPCPzK4lRiV7Ys
         KaDOeWMYO8FkPRrDa556cbPsX9v0XorNNP9y1tKMOnPaqFZz7ZRpb4MBpeNl18zHu1G+
         oJkA==
X-Gm-Message-State: APjAAAWBkzMAVWR4B5gZ58ApIgP3R37LCBEPchllYtvolieQcahkEj4N
        B6GrfWOF8+z690mfg6SYKcTREZQJbkDpPg==
X-Google-Smtp-Source: APXvYqxHue+dQR7lc2GvGoETN2NKUWvr5ce/0WxyvCcvctat2XrFpbShBd6EEsQySe1MsipMtKR0Nw==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr20580873wrq.86.1557238988190;
        Tue, 07 May 2019 07:23:08 -0700 (PDT)
Received: from [192.168.0.93] (88-112-122-53.elisa-laajakaista.fi. [88.112.122.53])
        by smtp.gmail.com with ESMTPSA id c6sm11930126wmb.21.2019.05.07.07.23.06
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 07:23:07 -0700 (PDT)
Subject: Re: merge usbhid-dump into usbutils repo?
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <20190507140042.GA26528@kroah.com>
From:   Nikolai Kondrashov <spbnick@gmail.com>
Message-ID: <8f35c8e9-9ee0-a883-30e4-8b532316137d@gmail.com>
Date:   Tue, 7 May 2019 17:23:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190507140042.GA26528@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On 5/7/19 5:00 PM, Greg KH wrote:
> So, what do you think about the two options here?

I would absolutely be glad if you could take usbhid-dump under your wing!

I have little time for the DIGImend project these days, for which it was
developed. I have a bit of financing from Patreon and occasional tablet
manufacturer to work on the drivers, but that leaves very little time for the
tools.

I wouldn't mind submitting any patches required to usbutils repo instead.
And it's true the thing haven't needed much updates recently.
Please also feel free to adjust it to your tastes too.

Thanks for looking after it!

Nick

P.S. It's awesome to see you receive Red Hat's Kernel CI effort so
positively. Everyone's cheering for your feedback every time here :)

On 5/7/19 5:00 PM, Greg KH wrote:
> Hi Nikolai,
> 
> As you know, usbhid-dump has been part of the usbutils repo for a long
> time, as a git submodule.  And that's been fine, a bit messy at times
> for when I forgot to update the submodule, but overall ok.
> 
> However, I've changed the way usbutils is being released (with the 011
> release that I tagged yesterday, but did not announce anywhere).
> Instead of a tarball generated on my "random desktop of the day" by
> running 'make distcheck' on the tree, I wanted to rely on the kernel.org
> infrastructure to do a "clean checkout" of the tree and make a tarball
> just based on the git repo itself.
> 
> That way people can actually rely on what is in the tarball really is
> what is in the git tree, and you don't end up running some random script
> that my personal machine happened to create (not a good idea).
> 
> This is fine, except when it comes to the git submodule.  kernel.org
> can't be expected to pull some random submodule from a random location
> into it's tree when signing things, as that would be a total mess.
> 
> So, I came up with two possible solutions:
>    1) remove usbhid-dump from usbutils.
>    2) move usbhid-dump into usbutils.
> 
> The first option is a bit sad, as some users of usbhid-dump might find
> it go away and now all of the distros have to go and dig and find a new
> package to add to their repos.  You would also then be responsible for
> doing releases and notifying everyone on your own, instead of having
> that done for you like it is today.
> 
> The second option is in my opinion the best one.  You can contribute
> directly to the usbutils repo by providing patches/pull requests when
> changes are needed.  Given the slow-down in development of this package
> over the years, I doubt much is left to do on it, so that shouldn't be a
> big deal.
> 
> As a test-run, I've done a merge of the usbhid-dump repo into the
> usbutils repo directly, by rewriting the directory location of the
> usbhid-dump repo into usbhid-dump/ and then merging the two trees
> together, such that no authorship or history is lost.  You can see the
> result of that here in the branch here:
> 	https://github.com/gregkh/usbutils/tree/usbhid-dump-merge
> 
> That branch seems to work fine for me here, with everything building
> properly.
> 
> Note, if we do go with the second option, I would like to look into
> "simplifying" the usbhid-dump codebase a bit, moving away from a library
> and loads of include files into something a bit simpler, as the
> complexity of the build system here seems a bit of an overkill for a
> "simple" binary.
> 
> So, what do you think about the two options here?
> 
> thanks,
> 
> greg k-h
> 

