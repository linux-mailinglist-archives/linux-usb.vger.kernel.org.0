Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FCAA1EB2B
	for <lists+linux-usb@lfdr.de>; Wed, 15 May 2019 11:45:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbfEOJpA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 May 2019 05:45:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51512 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfEOJpA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 May 2019 05:45:00 -0400
Received: by mail-wm1-f68.google.com with SMTP id o189so1940724wmb.1
        for <linux-usb@vger.kernel.org>; Wed, 15 May 2019 02:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=DtE5HfpZ+1qLrXuVQIbAVQkRD8RJlyrTRnxIJR/9Qsw=;
        b=ugX6i4OrdC+UZoznH6hLcexrGpTujUDcdsOyi4i98cGQ4xpLoA9UjtUCNdXDv7WojE
         tR+DlFn9yGc5c/KXHu3DIW/9Ixz3V1VtqQSXSCYnh8vBSvhC+I2yZIOr1+Ypyq02KaOY
         IjnjhdGSp4pvqsn4xMmPEe+VX9ukaUfBbRue0Z0EEqFdfS1jodVZR4Acq1pwoCY9x/Cv
         G4Zx+tDkWCirGlr6ePP1RSdvkB6d9OLk4C01ozmdXrdvG/Q6IlNMFp4aLfsH+aQmVFe/
         N5nvBqfqPJKXjZUmjPZsG9Cp7pr4WqCwCQ3t7MRRZ69vWDFEmfPDaoGsH2p+lCrwwh5c
         Kj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=DtE5HfpZ+1qLrXuVQIbAVQkRD8RJlyrTRnxIJR/9Qsw=;
        b=sYAh5SiKumoBiv5tOj6M5MurSOnZd+fCyZp7l97q7Yg2JyjQZqorsgBpBR5t1F21+B
         BIiBln3RkXGKyZoCOUJ0HFVSJceFVfDZ2leL8brY1fzRFvFBbJjNMdK3VbVv0hoo9nAS
         MdpbFuIk+DbD5KoEHnRASBFGdIJHK/HOkiRzOU+50bwzAHE4yjK+iRiA1XdVYz0Mqqk5
         UyT7VJXrYpqh8KqER+6xyQUcCoL7snzkOABfC/i5XkwZPj8bWQJj8ORboSgaI1mgOJYU
         462nvFWRnRu8911p/Mj99IKZ6ykFnD0rx37RubD0V2QTMUIuQBaTDr1mRezY/ldGgisd
         n6Xw==
X-Gm-Message-State: APjAAAWENShR4LEykl7tPybSAOn6jbgEdUeiH6DLPJ8a4zziyKUwbez6
        2LacrLTyVVg4KZvpS4gnWUduCEaYrcA=
X-Google-Smtp-Source: APXvYqxkoIvkqJFRe89FKzN6JMv8Vi5ELPAijKSwFqaz4sdD0rG36eUIOP/bcCzykmpc2y/sDmcOFA==
X-Received: by 2002:a05:600c:23ce:: with SMTP id p14mr8580468wmb.36.1557913497835;
        Wed, 15 May 2019 02:44:57 -0700 (PDT)
Received: from [192.168.99.70] (mail.unidataz.cz. [193.165.148.130])
        by smtp.googlemail.com with ESMTPSA id a4sm1923346wmf.45.2019.05.15.02.44.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 02:44:57 -0700 (PDT)
From:   "StarostaCZ@gmail.com" <starostacz@gmail.com>
X-Google-Original-From: "StarostaCZ@gmail.com" <StarostaCZ@gmail.com>
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on AMD
 boards.
To:     Oliver Neukum <oneukum@suse.com>, Joerg Roedel <joro@8bytes.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
 <20190429094847.GI26546@localhost> <20190503153716.GE11605@8bytes.org>
 <8748125e-f360-ff0e-ea15-699bce9e7747@gmail.com>
 <4e7f0267-eba8-81c3-4036-25924ea9df98@gmail.com>
 <1557911856.2950.10.camel@suse.com>
Message-ID: <d74dba47-5a58-cf34-3c36-975f9ccee0ea@gmail.com>
Date:   Wed, 15 May 2019 11:43:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1557911856.2950.10.camel@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: cs
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

As I wrote, I made new test on kernel Linux version 5.1.0-050100-generic 
amd64:
https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.1/
Same problem, system crash after a few seconds. Full kern.log: 
https://paste.ee/p/EmLsw

Unfortunately, I can't judge if the patch is there, but I found, that 
this patch was added to kernel 5.0.2:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/iommu/amd_iommu.c?id=4e50ce03976fbc8ae995a000c4b10c737467beaa
Can I somehow verify that the patch is in this ubuntu kernel 5.1.0?

starosta

Dne 15.5.2019 v 11:17 Oliver Neukum napsal(a):
> On Mi, 2019-05-15 at 09:54 +0200,  StarostaCZ@gmail.com  wrote:
>> Hello,
>> can I still help with this problem? It's very important for us. Thank you.
> Your first step would be t verify whether your kernel has the
> fix coming in the patch Joerg mentioned.
>
> 	Regards
> 		Oliver
>

