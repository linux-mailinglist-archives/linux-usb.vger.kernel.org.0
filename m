Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C856414FA5
	for <lists+linux-usb@lfdr.de>; Wed, 22 Sep 2021 20:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237016AbhIVSQl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Sep 2021 14:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236987AbhIVSQk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Sep 2021 14:16:40 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BFD2C061756
        for <linux-usb@vger.kernel.org>; Wed, 22 Sep 2021 11:15:10 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id b10so4594862ioq.9
        for <linux-usb@vger.kernel.org>; Wed, 22 Sep 2021 11:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZQV4XJx/DFSXSOOyfOEMFYhipz4Fl6dlEeGzliw9JTY=;
        b=bvxZ6G1NA+MLuCa5cGubm24q50H3hoy0Bog3f5krwJUlAuv9vo2dthuljO8qqFfBV5
         ghKmtYxnqBFZiZPrqZl6ejmknepVPS99/2BLn/IEQJD3BXTsy/TtRAUNUDwysKTFMHwu
         d7BeHvj0WRfPQ0RsHMF/DF05SdFJ/9EyGoy/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZQV4XJx/DFSXSOOyfOEMFYhipz4Fl6dlEeGzliw9JTY=;
        b=jXpxrXqgGthayDvrapfyGKvhz85hfnDJ9p0ZFEL+RV6ajBC/QGMYYxu5SgGb/+FAZ1
         mpVgllwaPooAPafxBXepYt2AeIrldKBhOLuSebmmRa3rjFSR+Gfh7+eh9b21UPXzNJAt
         0m9b++/7CBtl5AbiKxAp0LDkBoIeJhjvGzvzWgKnAoQ/cC+HaAFmuDzhpQXG71stvf+R
         QdvVQB296QtAIh9BMaMMhJuz9Mw6tHcT5mDhsTTIgbtWJlWSZsvuEDcypAP8WvbiL6Le
         QdzfcOQs0Z0dd9Q7/7F+cA54z3kLWqNIgKgOpQ4bxwWpbzzqZk0uqOtPoHwh16X7AGR8
         Pqzg==
X-Gm-Message-State: AOAM532jtt30fGIqA19/6BF0RiCJRi6WoqVigOP0tHAna7Kz0vxP7tMD
        wprGtnR5JX7AVG/2Q3w2B2WfJg==
X-Google-Smtp-Source: ABdhPJzpGFKPcvQ1dQiq6NQIIOHRYCS0MNJZnb/XlexqCV8ZWYYGunxpKKLw9XZAalIae/yWYmYlbw==
X-Received: by 2002:a5d:8d06:: with SMTP id p6mr295578ioj.7.1632334509796;
        Wed, 22 Sep 2021 11:15:09 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b3sm1369122ile.37.2021.09.22.11.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 11:15:09 -0700 (PDT)
Subject: Re: INFO: task hung in hub_port_init
To:     Alan Stern <stern@rowland.harvard.edu>,
        Hao Sun <sunhao.th@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        a.darwish@linutronix.de, johan@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        oneukum@suse.com, Shuah Khan <skhan@linuxfoundation.org>
References: <CACkBjsYQxQxGQwb3YS4obVWH3EODzqky5=nM3ADP7+13hBYgAA@mail.gmail.com>
 <20210913135459.GA120302@rowland.harvard.edu>
 <CACkBjsZcg0B=tF8cr54VqaJMVURD9R463epZqRQfesnoY=+L8g@mail.gmail.com>
 <20210918020245.GA69263@rowland.harvard.edu>
 <CACkBjsZPjO96NzLjKR2N7bYzBJRN6sPuaDpK6cvmGqKTd=Byow@mail.gmail.com>
 <20210918135301.GA79656@rowland.harvard.edu>
 <2d776f5b-c6b5-1c05-de37-493fc10a97af@linuxfoundation.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <4a59e9e7-4501-4328-f985-0a82593af282@linuxfoundation.org>
Date:   Wed, 22 Sep 2021 12:15:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2d776f5b-c6b5-1c05-de37-493fc10a97af@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Hao Sun,

On 9/20/21 8:31 AM, Shuah Khan wrote:
> On 9/18/21 7:53 AM, Alan Stern wrote:
>> On Sat, Sep 18, 2021 at 10:17:26AM +0800, Hao Sun wrote:
>>> Alan Stern <stern@rowland.harvard.edu> 于2021年9月18日周六 上午10:02写道：
>>>>
>>>> On Sat, Sep 18, 2021 at 09:56:52AM +0800, Hao Sun wrote:
>>>>> Hi Alan,
>>>>>
>>>>> Alan Stern <stern@rowland.harvard.edu> 于2021年9月13日周一 下午9:55写道：
>>>>>>
>>>>>> On Mon, Sep 13, 2021 at 11:13:15AM +0800, Hao Sun wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> When using Healer to fuzz the Linux kernel, the following crash was triggered.
>>>>>>>
>>>>>>> HEAD commit: ac08b1c68d1b Merge tag 'pci-v5.15-changes'
>>>>>>> git tree: upstream
>>>>>>> console output:
>>>>>>> https://drive.google.com/file/d/1ZeDIMe-DoY3fB32j2p5ifgpq-Lc5N74I/view?usp=sharing
>>>>>>> kernel config: https://drive.google.com/file/d/1qrJUXD8ZIeAkg-xojzDpp04v9MtQ8RR6/view?usp=sharing
>>>>>>> Syzlang reproducer:
>>>>>>> https://drive.google.com/file/d/1tZe8VmXfxoPqlNpzpGOd-e5WCSWgbkxB/view?usp=sharing
>>>>>>> Similar report:
>>>>>>> https://groups.google.com/g/syzkaller-bugs/c/zX55CUzjBOY/m/uf91r0XqAgAJ
>>>>>>>
>>>>>>> Sorry, I don't have a C reproducer for this crash but have a Syzlang
>>>>>>> reproducer. Also, hope the symbolized report can help.
>>>>>>> Here are the instructions on how to execute Syzlang prog:
>>>>>>> https://github.com/google/syzkaller/blob/master/docs/executing_syzkaller_programs.md
>>>>>>>
>>>>>>> If you fix this issue, please add the following tag to the commit:
>>>>>>> Reported-by: Hao Sun <sunhao.th@gmail.com>
>>>>>>
>>>>>> There's not much hope of finding the cause of a problem like this
>>>>>> without seeing the kernel log.
>>>>>>
>>>>>
>>>>> Healer found another Syzlang prog to reproduce this task hang:
>>>>> https://paste.ubuntu.com/p/HCNYbKJYtx/
>>>>>
>>>>> Also here is a very simple script to execute the reproducer:
>>>>> https://paste.ubuntu.com/p/ZTGmvFSP6d/
>>>>>
>>>>> The `syz-execprog` and `syz-executor` are needed, so please build
>>>>> Syzkaller first before running the script.
>>>>> Hope this can help to find the root cause of the problem.
>>>>
>>>> I don't have time to install and figure out how to use Healer and
>>>> Syzkaller.  But if you run the reproducer and post the kernel log,
>>>> I'll take a look at it.
>>>>
>>>
>>> Just executed the reproducer, here is the full log:
>>> https://paste.ubuntu.com/p/x43SqQy8PX/
>>
>> The log indicates that the problem is related to the vhci-hcd driver
>> somehow.  I don't know why those "Module has invalid ELF structures"
>> errors keep appearing, starting in line 1946 of the log.
>>

Can you send me your config? This message is rather odd.

[   82.249631][ T6679] Module has invalid ELF structures

It is right below:
[   82.248529][ T6679] vhci_hcd vhci_hcd.0: Device attached

or

[   83.860819][ T6710] vhci_hcd vhci_hcd.0: port 0 already used

My guess is this isn't the vhci_hcd module that gets loaded at this
point when we see this message, but another module that gets loaded
when vhci_hcd initiates probe after device attach. Note that vhci_hcd
is loaded earlier.

It is possible, the hung task might be related to load_module()
failure. Unfortunately load_module() doesn't print elf_validity_check()
error.

Would you be able to add this patch and run the reproducer again?


--------------------------------------------------------------------
diff --git a/kernel/module.c b/kernel/module.c
index 40ec9a030eec..02f758b04f05 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3941,7 +3941,8 @@ static int load_module(struct load_info *info, const char __user *uargs,
          */
         err = elf_validity_check(info);
         if (err) {
-               pr_err("Module has invalid ELF structures\n");
+               pr_err("Module has invalid ELF structures error (%ld)\n",
+                       err);
                 goto free_copy;
         }

--------------------------------------------------------------------

thanks,
-- Shuah

