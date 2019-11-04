Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F987EDC7D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Nov 2019 11:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfKDK1R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Nov 2019 05:27:17 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38484 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727766AbfKDK1R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Nov 2019 05:27:17 -0500
Received: by mail-lf1-f65.google.com with SMTP id q28so11837762lfa.5
        for <linux-usb@vger.kernel.org>; Mon, 04 Nov 2019 02:27:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=26diUKx0LbEqsEfVguJF7yiMWfaTilIn/Dzjse6t1hE=;
        b=US6dYbdixEDShwXyNfjvf01njgbZvzmglLoIjTJoDYL4F4rDuS9DdJqUPKIOw//QNp
         czxtutNIQbW+ZY1f+5ZHT3HlLqPliigUdLT4TFaVEPql9OQrNRcx+O2aTNVzimbYA3zp
         NUXMQh5+Ouziy6AAiuEG4MRkoAx8ys22Fq1smRW0FkwnkMiKVLWZHxK+TwhKDNrAlrDv
         i+NZTDBiykhkKB/iwp4PaWLp3et5oO4XCn6S3f5RcIrCayZaK41QVGE2RD/ONLp0cGLc
         NtWdETa+ceyfpahPUo8vf8+U4qiPBvwzgyDDcVFKrVXtTNZUZgqK89h9dpdtcGbF/aLL
         QwvQ==
X-Gm-Message-State: APjAAAWHJ3rZL1WKVO4T/4yQ7se0NaoODP451GI3NBQafMG8bbBwg7UN
        ZxJzcpqKqyVvHjIw/xTAB/7V2sV6
X-Google-Smtp-Source: APXvYqyIYS3vZ8iY+UJej9Qm+ahYnvcAekGLPHn6D0167zg+PfzAc7wLv2PbQOYzcaQxK6IyXjZyHg==
X-Received: by 2002:a19:3fcd:: with SMTP id m196mr16191489lfa.118.1572863235081;
        Mon, 04 Nov 2019 02:27:15 -0800 (PST)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id k68sm8965424lje.86.2019.11.04.02.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2019 02:27:14 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iRZZp-00064D-Il; Mon, 04 Nov 2019 11:27:13 +0100
Date:   Mon, 4 Nov 2019 11:27:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Charles Yeh <charlesyeh522@gmail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        =?utf-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Subject: Re: [PATCH] [PATCH v8] USB: serial: pl2303: Add new PID to support
 PL2303HXN (TYPE_HXN)
Message-ID: <20191104102713.GG3657@localhost>
References: <20190924121400.1497-1-charlesyeh522@gmail.com>
 <20191023085657.GP24768@localhost>
 <CAAZvQQ7EdZ=5TtU0qHBzACQ=g5equR+F-j2nt+-0F3bYOH4F7A@mail.gmail.com>
 <20191104091521.GF3657@localhost>
 <CAAZvQQ5jTcEz8C4QDkRGdS+WiDv7YMMiX4kyLfjUTxxpUSPxwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAZvQQ5jTcEz8C4QDkRGdS+WiDv7YMMiX4kyLfjUTxxpUSPxwg@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 04, 2019 at 06:13:03PM +0800, Charles Yeh wrote:
> > I'm not sure I understand your question; what did you mean here?
> >
> > This patch will be included in Linux 5.5, if that's what your asking.
> 
> At 1/18/2018, "USB: serial: pl2303: add new PID to support PL2303TB" is approved
> At 1/27/2018, Greg KH help to update the patch on 4.20, 4.19, 4.14,
> 4.9, 4.4, 3.18 stable tree.

> Therefor, this time can update the patch between 5.5 and 4.4 (or 3.18)?

No, I'm afraid not.

Generally only bug fixes are backported to the stable trees, but we
make an exception for simple patches adding new device ids to existing
drivers.

That's what 4dcf9ddc9ad5 ("USB: serial: pl2303: add new PID to support
PL2303TB") did, and that's why it got backported.

This patch, in contrast, adds support for a new protocol used by a class
of devices which were not supported before, and therefore does not meet
the stable-kernel criteria for backports.

Johan
