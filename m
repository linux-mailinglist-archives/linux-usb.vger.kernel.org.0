Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08D52E96BA
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 15:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbhADOFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 09:05:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbhADOFH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Jan 2021 09:05:07 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A8CC061574
        for <linux-usb@vger.kernel.org>; Mon,  4 Jan 2021 06:04:26 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id qw4so36891792ejb.12
        for <linux-usb@vger.kernel.org>; Mon, 04 Jan 2021 06:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=BcFI2Nw3xVQxOuv9tvr4E6ehVLieVPuxYqFfccqeGX0=;
        b=tE3QbhnObvwohTRtSQW+F0475xZ/rQrf85pjO230gnmr7DnAEc6/KbrCWBdBINY8kT
         PN07ckAOWKrStzHMc1tRV3SqZ7i1xl5pGjYoDmAsX1KDkkp0uVd09W4EPrjH4vBGUE/2
         rQUlnY3KZBHxpPfRJi6zEWQnFoyYkbrHK1MQNPO5d9L9syBN16M9OIe+JgUy82Vc9hcE
         zOUVqqK9q1SUoS3plLS0FtPu0eols5qIDAn4c7fOP0yNstR0H5gD3NnzwTkUrlzcE+Zv
         rXohnIOcY2WjaZ0xQaQagZYYUMlE0F0vA+EFc5DqgYtS9AHNIgiFHaEzIyhhU5BQCMss
         MNVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=BcFI2Nw3xVQxOuv9tvr4E6ehVLieVPuxYqFfccqeGX0=;
        b=g0FRDIX+618oySzkoOLtgCiP4mLJOhkTVkl+aMgtJRC3oFlk6WZ/zwMmwuoMWA43iG
         PCac22oMskFASOm3Ihj7sevepgvRap2kkS9xzWlX2fhcBq35FzBzWPpAL03oYXeOHo1G
         ovFTSsiwes2uE5xHMQn3rxaGma0y2jn4oZWNkUx6bQPiMInaCwZBI9RTaC/Jb97sg9Om
         nt4GB7k6D8KIXUeFz5BVuJGgDuVkTDD6VXFYFYmzbgRg61zc2GBu5wC1Z2OERYip/5wf
         ZqzZglx7l/RSCHEXR7qWoNBSV0Hz+hYrM9HrBrwVaor7hlU7cIaSRRrdzYryz6z8CcU8
         Q3Zg==
X-Gm-Message-State: AOAM532GZpp0QmpZYPlBjlCPXINnNyBqddE5Lpm6TgRiKzWWJ2YPhS6O
        SeWJsZLWiatvAaD0kcjeGyzZU2t/R0pLlA==
X-Google-Smtp-Source: ABdhPJzsyvsDLxeyh2840F9nLtE9Y5ZRGsAblmWzXRKP9sM6ZdLnKCF9RVK9tfsXzNaGDjssB7jpKg==
X-Received: by 2002:a17:906:f9da:: with SMTP id lj26mr65324472ejb.467.1609769065595;
        Mon, 04 Jan 2021 06:04:25 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.gmail.com with ESMTPSA id cb14sm23859541ejb.105.2021.01.04.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 06:04:25 -0800 (PST)
References: <202012291638.QiDQi3Gs-lkp@intel.com> <X+sHKyfBnrT/8dIG@kroah.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        kernel test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-usb@vger.kernel.org
Subject: Re: [usb:usb-testing 8/8]
 drivers/usb/gadget/function/u_audio.c:248:9: warning: implicit conversion
 from 'unsigned long long' to 'unsigned long' changes value from 4294967296
 to 0
In-reply-to: <X+sHKyfBnrT/8dIG@kroah.com>
Message-ID: <1jturwx0gn.fsf@starbuckisacylon.baylibre.com>
Date:   Mon, 04 Jan 2021 15:04:24 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue 29 Dec 2020 at 11:38, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Dec 29, 2020 at 04:38:44PM +0800, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
>> head:   32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
>> commit: 32510cf5e554e8f2cecafea8b8cc11daa4afb9e6 [8/8] usb: gadget: u_audio: factorize ssize to alsa fmt conversion
>> config: arm-randconfig-r003-20201229 (attached as .config)
>> compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project cee1e7d14f4628d6174b33640d502bff3b54ae45)
>> reproduce (this is a W=1 build):
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         # install arm cross compiling tool for clang build
>>         # apt-get install binutils-arm-linux-gnueabi
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
>>         git remote add usb https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
>>         git fetch --no-tags usb usb-testing
>>         git checkout 32510cf5e554e8f2cecafea8b8cc11daa4afb9e6
>>         # save the attached .config to linux build tree
>>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm 
>> 
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>> 
>> All warnings (new ones prefixed by >>):
>> 
>> >> drivers/usb/gadget/function/u_audio.c:248:9: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 4294967296 to 0 [-Wconstant-conversion]
>>                    ret = SNDRV_PCM_FMTBIT_S24_3LE;
>>                        ~ ^~~~~~~~~~~~~~~~~~~~~~~~
>>    include/sound/pcm.h:170:34: note: expanded from macro 'SNDRV_PCM_FMTBIT_S24_3LE'
>>    #define SNDRV_PCM_FMTBIT_S24_3LE        _SNDRV_PCM_FMTBIT(S24_3LE)
>>                                            ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>    include/sound/pcm.h:139:39: note: expanded from macro '_SNDRV_PCM_FMTBIT'
>>    #define _SNDRV_PCM_FMTBIT(fmt)          (1ULL << (__force int)SNDRV_PCM_FORMAT_##fmt)
>>                                             ~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>    1 warning generated.
>
> I'm dropping this patch from my tree now, thanks.
>

Tested on 64bits platform only, sorry about that.
I'll respin with u64 which is the actual type of "hw.formats" .

> greg k-h

