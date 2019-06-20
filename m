Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30034D13A
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 17:01:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732237AbfFTPBe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 11:01:34 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:38764 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731790AbfFTPBd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jun 2019 11:01:33 -0400
Received: by mail-pf1-f175.google.com with SMTP id a186so1826691pfa.5
        for <linux-usb@vger.kernel.org>; Thu, 20 Jun 2019 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:references:user-agent:from:to:cc:subject:organization
         :in-reply-to:reply-to:address:date:message-id:mime-version;
        bh=RAjLd3rOi7VQingOLk6ED/7HKe+iLY2AEFnL7TTVdM8=;
        b=I9SILAKwUMDc949dDZArLTX/ylwY6biheOFYqm+uGKIUO2OOld4hRGM9SXJSVXiY1o
         Meh5Ko8o8CoGw/97yla4jtiHVKigj9LcItwnm8J/InkGVKIvqCO07GX2YrFx/ICxUN26
         9QNY67XlA0gqygaik3Er6ZdCUZcrMmm+YG5FfL8D04BOQd4iE6JqM58v17FcbG35uSps
         SeAzdEkG5BGrz3DTdoqwngD8iiGSV9HmPx3ZqJRqfR4st2OvCm+urD/Aj58VaPzPe2Q8
         0scY7Xw2ynQViwkyOo6Ydgx1pZoxyC95VF7epl7hu97AP9npmkRcR39+ZRX/t1O9tP6S
         BSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:references:user-agent:from:to:cc:subject
         :organization:in-reply-to:reply-to:address:date:message-id
         :mime-version;
        bh=RAjLd3rOi7VQingOLk6ED/7HKe+iLY2AEFnL7TTVdM8=;
        b=IbJfpcdl/BZgU+UevoYsn3yxKGFFR6eqn6aZkN7ZJbqzZMDju066TlV2J102/j54pX
         Ed3eUP3gPlmJ1TKUKwcmCWvlRtfZnRzqyj/PPUrS0vqv/ZBDxUoJXMBmp5mN7YP3RMuR
         yOl9jLjDvfICWscwb/5D5uvde4ssEtdXbxY/KzxyiTUppiKj1Mrx0znknatD3xxuiXk/
         otoS53iMvWrE7nHQTR5dCQuLUrLz7gWC888LnYuFYGBEfHHIudi6/Svfd7JLc9OYIRJe
         Qx4kV00RO0IC5VXtzPvJwtNkL/Up1TzlRV2jFFvIikJLoRw7y4VsrcX4wzwVl8Jyl65r
         GmRg==
X-Gm-Message-State: APjAAAX9GkpcyEkMd/m5LNhbBPCfgbBsGNP5stjjPU0UrOVLHDYlaq5A
        bt0qoJv0Vl6U2wkjH31yz+s=
X-Google-Smtp-Source: APXvYqyRmdgahqLRIOnidcdioRa1I98BbQLlMJtfozW0BBW07Lt/HF5XvYU9O8Dv2hwT3ts45zJp0Q==
X-Received: by 2002:a62:4e48:: with SMTP id c69mr108716743pfb.176.1561042892845;
        Thu, 20 Jun 2019 08:01:32 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id d13sm7576pjs.32.2019.06.20.08.01.31
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 20 Jun 2019 08:01:32 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id 6C9BF467C40; Thu, 20 Jun 2019 08:01:30 -0700 (PDT)
References: <201906202227.KeVsA81p%lkp@intel.com>
User-agent: mu4e 1.0; emacs 26.1
From:   dmg <dmg@turingmachine.org>
To:     linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [usb:usb-testing 46/46] drivers/usb//misc/adutux.c:375:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t {aka unsigned int}'
Organization: turingMachine
In-reply-to: <201906202227.KeVsA81p%lkp@intel.com>
Reply-To: dmg@turingmachine.org
Address: dmg@turingmachine.org
Date:   Thu, 20 Jun 2019 08:01:30 -0700
Message-ID: <87wohgs3lh.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


kbuild test robot <lkp@intel.com> writes:

[...]
>
> All warnings (new ones prefixed by >>):
>
>    In file included from include/linux/printk.h:332:0,
>                     from include/linux/kernel.h:15,
>                     from drivers/usb//misc/adutux.c:19:
>    drivers/usb//misc/adutux.c: In function 'adu_read':
>>> drivers/usb//misc/adutux.c:375:4: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t {aka unsigned int}' [-Wformat=]
>        "%s : while, data_in_secondary=%lu, status=%d\n",

I am not sure what is the best way to address this warning.

size_t seems to be architecture dependent. On my computer (intel64)
size_t is long unsigned int, but in this test it is int unsigned.

Are there any suggestions on what is the best way to deal with this?

casting size_t to long unsigned int will work, but it sounds kind of
ugly.


thank you,


--daniel


--
Daniel M. German                  "We die. That may be the meaning of life.
                                   But we do language. That may be
   Toni Morrison ->                the measure of our lives."
http://turingmachine.org/
http://silvernegative.com/
dmg (at) uvic (dot) ca
replace (at) with @ and (dot) with .
