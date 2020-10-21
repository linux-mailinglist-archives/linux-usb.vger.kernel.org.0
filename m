Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEC45294732
	for <lists+linux-usb@lfdr.de>; Wed, 21 Oct 2020 06:19:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440126AbgJUETB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Oct 2020 00:19:01 -0400
Received: from aibo.runbox.com ([91.220.196.211]:35154 "EHLO aibo.runbox.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411917AbgJUETA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Oct 2020 00:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
         s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
        bh=lokW6EPR1gGvrw+jQAtROfY+YGwZBe7P2txdVPg31H0=; b=gk9mRn3K5bQoIbZNooQoADXA6H
        EPPsSEZUluHAaWQhhzE6XWIF7KygXOFX93vxvBzYQ/EysFFadWgP0r7DX6wq9I/YCI+Xv4rML9DRh
        6zF7JXMrVZh9QebJaP53GMPtfaMFCBjyE7d0BFaCcatYavlDqr2N13kZ6wmNBkmvxFO6Jyo8+5Wv8
        u3y5fUPuvZGkXWbcezvHr/0EXj1McQDRaeYNIViztarkNueH0K7xFAnegZVwG1kRvcwksrEgmbSnV
        6iTY73Kd3sXHd08vbqqbVcmmVYrOaPSMlNd3JUGK6NmGPlQ4UWhj6t6r0t6o4PPGCi0I5cp71IMhP
        Gie8s9bA==;
Received: from [10.9.9.72] (helo=submission01.runbox)
        by mailtransmit03.runbox with esmtp (Exim 4.86_2)
        (envelope-from <m.v.b@runbox.com>)
        id 1kV5aT-0003xw-U8; Wed, 21 Oct 2020 06:18:58 +0200
Received: by submission01.runbox with esmtpsa  [Authenticated alias (536975)]  (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        id 1kV5aG-00016w-Ne; Wed, 21 Oct 2020 06:18:45 +0200
Subject: Re: Bug caused by 53965c79c2db (USB: Fix device driver race)
To:     Pany <pany@fedoraproject.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Bastien Nocera <hadess@hadess.net>, linux-usb@vger.kernel.org
References: <CAE3RAxt0WhBEz8zkHrVO5RiyEOasayy1QUAjsv-pB0fAbY1GSw@mail.gmail.com>
 <20201017200200.GB842001@rowland.harvard.edu>
 <CAE3RAxvNUvzqKT+GK3A4cQ7Tm_tFRQJKfJ01r0ic-5066fikDA@mail.gmail.com>
 <20201019174028.GF898631@rowland.harvard.edu>
 <cf1e7059-e1d2-2e7a-89c1-0c162850fbb4@runbox.com>
 <CAE3RAxuX6SBKx22q6XZ7wTVYQNzJqZ=2Vsc4jOqK3V2-mgYOqQ@mail.gmail.com>
From:   "M. Vefa Bicakci" <m.v.b@runbox.com>
Message-ID: <3fcc724f-5b5e-e441-fd12-31365d140773@runbox.com>
Date:   Wed, 21 Oct 2020 00:18:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <CAE3RAxuX6SBKx22q6XZ7wTVYQNzJqZ=2Vsc4jOqK3V2-mgYOqQ@mail.gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/10/2020 23.17, Pany wrote:
> Thank you so much for guiding me!
> On Tue, Oct 20, 2020 at 12:04 PM M. Vefa Bicakci <m.v.b@runbox.com> wrote:
[Snipped by Vefa]
>> Pany, in the mean-time, could you add the following string to your kernel's
>> command line (i.e., via GRUB, or the actual boot-loader that you use) and
>> let us know whether it helps to *work around* this issue with the latest
>> versions of 5.8.y kernels?
>>
>>          module_blacklist=apple-mfi-fastcharge
> 
> And I also installed the official built kernel-5.8.15-201.fc32.x86_64.rpm [5].
> 
> Adding module_blacklist=apple-mfi-fastcharge to the GRUB entry did not
> succeed in the kernel booting.
> 
> With following kernel cmdline, I captured the journal [6]:
> 
> kernel: Command line:
> BOOT_IMAGE=(hd5,gpt3)/vmlinuz-5.8.15-201.fc32.x86_64
> root=/dev/mapper/fedora_localhost--live-root ro
> resume=/dev/mapper/fedora_localhost--live-swap
> rd.lvm.lv=fedora_localhost-live/root
> rd.luks.uuid=luks-65d9ed28-ea08-4ea5-a1dd-7b2b086f5e09
> rd.lvm.lv=fedora_localhost-live/swap
> module_blacklist=apple-mfi-fastcharge systemd.debug-shell=1

Hello Pany,

My apologies, the original kernel command line entry I mentioned was
incorrect; the module name needs to be specified with underscore characters
("_") instead of dash ("-") characters. Could you try the following as well?

   module_blacklist=apple_mfi_fastcharge

Using this string in the kernel command line causes "modprobe apple-mfi-fastcharge"
to fail with -EPERM on my system, and hence I am hoping that this should
at least unblock your day-to-day use of recent kernels.

Sorry again for the mistake in my earlier suggestion.

Vefa
