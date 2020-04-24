Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACD91B76BE
	for <lists+linux-usb@lfdr.de>; Fri, 24 Apr 2020 15:17:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727056AbgDXNQr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Apr 2020 09:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726793AbgDXNQr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Apr 2020 09:16:47 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F229FC09B046
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 06:16:46 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id hi11so3862752pjb.3
        for <linux-usb@vger.kernel.org>; Fri, 24 Apr 2020 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oa/oNHUWZOTRPTTfBqwCxMu6cnopDNrg7qX1yx+D0Es=;
        b=fDrLWAOe45JA/LlPn6FGyX7H7o/h14fgDXB7FCyKQsisVv0+/iUotKI6wPbKEektvn
         D/49HKMvtl9DVcaX4nX4fdoVtPTEu2ublJHjyzAqW2Ruyeph6+S9B5jV33MLS0rC5BtH
         neGu6sihmDZD8pQcNqhRXd2fZZJtxMZcFp0OfwKTivAfvYIMT+/AXCsLYBUR0RpwmDdS
         9xww8khHXsEbkeZ9rsiEwB3OG89vUAOkkDtWiYgbPvZ2K8l3VObxpT+ShS0semRQvTKa
         hKUU5Ot6zpH9uSKbbLYrhdzcWNrxc/hBMcbLzrSbTO/rpPCyGzId1Kxep91t4RcDPR6X
         eoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oa/oNHUWZOTRPTTfBqwCxMu6cnopDNrg7qX1yx+D0Es=;
        b=TMsbAM7Zh2NVVScVWLYFZrSYv2wv+rQLA8UhYunwcJSa3QYNH5kSLn5uhDYzcxTPpY
         CLhzORkccUudH8BA3vbhqpK/2nxAIwEEFi56igdWkVv8KjFLMXdb/CBSODz9Z10Kt4H/
         M7n4ty7ryMQNLN1GyulVLHRkPE52Aya05Jnd9ixMDLTgi98XmlyuOFkLjmq1DSG6ZMct
         3WawW0GQkOV+B9tDghBWODEk26lbpjABhCusS6lZTV+K2VHzYyuWRvigIq+jGJM61m9v
         BHZk1uStlf/1BjDgPW/3lnyc+q+DRQdKS9W2SKbxlVHRG3IC4sIsJczmoecjkXxaPzAo
         ixLg==
X-Gm-Message-State: AGi0PubYifuLPEOGQHctXzpICCCUV8VuJVmPWlbFbv04AaZfiTYFQ8c4
        Wnips9tzOJQs4TGZidJFjSWnCjQPzzo1ZbhqcC6J/g==
X-Google-Smtp-Source: APiQypJOrLgs+kDHqzamHAX8n4seNWcLkNNFQ+4WcajoZ8auNmbQkqAS/xpZ05CHq4HN9oZLQfmbVvdG3WHUmuh3v9E=
X-Received: by 2002:a17:902:4c:: with SMTP id 70mr8948599pla.336.1587734206165;
 Fri, 24 Apr 2020 06:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <ca6b79b47313aa7ee9d8c24c5a7f595772764171.1587690539.git.andreyknvl@google.com>
 <20200424084307.GQ2682@kadam>
In-Reply-To: <20200424084307.GQ2682@kadam>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 24 Apr 2020 15:16:35 +0200
Message-ID: <CAAeHK+zS3WcmPEr9+hYGTMrZUwXyn5489Ke4f1zpdvTa-U-s9Q@mail.gmail.com>
Subject: Re: [PATCH USB 1/2] usb: raw-gadget: fix return value of ep read ioctls
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alan Stern <stern@rowland.harvard.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 24, 2020 at 10:43 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> On Fri, Apr 24, 2020 at 03:09:58AM +0200, Andrey Konovalov wrote:
> > They must return the number of bytes transferred during the data stage.
> >
> > Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
>
> This was my mistake.  Please add a Fixes tag.
>
> Fixes: 068fbff4f860 ("usb: raw-gadget: Fix copy_to/from_user() checks")
>
> I should have seen that bug...  I thought I was being careful and I
> even singled out that part of the commit and mentioned it in the
> commit message but I messed up.  Sorry.

No worries, the bug was actually present before your change, but in a
slightly different form. So FWIW we can also add:

Fixes: f2c2e717642c ("usb: gadget: add raw-gadget interface")

However raw-gadget is not present in any released kernel yet, so need
of backporting AFAIU.
