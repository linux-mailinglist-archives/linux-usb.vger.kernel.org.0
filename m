Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C8B16B67B
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 01:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728621AbgBYAOT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Feb 2020 19:14:19 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:38221 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728316AbgBYAOT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Feb 2020 19:14:19 -0500
Received: by mail-oi1-f196.google.com with SMTP id r137so10821612oie.5
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2020 16:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GZtmbSEgUmBA2cOgkuRpY+h9XbrXRgH0ndQIFRZmJ38=;
        b=cwjjB8VVG8XrJHr+9SEk59Jg97OlI73g/1W+hi/ky5xqv970/1C1XiAom2PD2PpLlg
         LdSsMUOe2CelKaeX76Shd1EAfnXlOeF+FYFyuoXZ10Olfto9EiXkoMm0tGHoKDv/tQOy
         kImfGPxJ08+5yri7sO6xsIMJniJTAg5sw3mO1zn3soZ8YMxwhoKA3Z+wIgucL1dn/jiQ
         A80GsJml5bRUrFSGKbq/A/MTdkhprhOWaXBvOZ6NEOeGV1g+/IvES68k2MW04/Xr9NJ+
         JlW1lyZ6UT2SkaBba5Qp5brJ7CBxbR54fQ2KT8ILx4VdDIt+VSaQlCnQefzgODfuZbyr
         w7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GZtmbSEgUmBA2cOgkuRpY+h9XbrXRgH0ndQIFRZmJ38=;
        b=ZCC5OrllJOjd3wDF7e7pJSplccycFNqgEa7HKXyHHQWvMMpiMZ3fBJESnCc6LbssS2
         qIjqZIGRsztFMEHy0Jnm0Kzu604SzPV27zf6yyXIvSFWgqelzcQwlxQPxsDOQeruCa+g
         v6CvVzwyX/QebTbYZggr5jFtmvyZC/t+Zvez+S/OuO0LX+3JfKioN1c1ziZJzTQCvQzj
         IU7Vyz4bAgA0U54Z9BCBY36BYF1VK1RdK8kGuLH0LZS3zc8bqE1qaVX0mcIBQGCn1LwM
         7miKHhigaEll+KX1/1CxpGPp/9LPtdHW2juDD9AoPlpvle9XyisiEShzh/vqZn8dT3P5
         iYUw==
X-Gm-Message-State: APjAAAUl8WSsac5PUM737zka0ISgdfj2xM7jSGCC97SIfpWZUI1g2zfq
        NOeOwPf3ns4zfpjGeNv3yh5tRGbgxu7FusZ9jQVg6w==
X-Google-Smtp-Source: APXvYqzsDX7BHdCV5vm2RuqNmJjUPSdFrnJPn1LX8SDfKwKqUUphTqyN7w7FRi0e9tlsvwDFCvuFTUG2RmHNvqX3in0=
X-Received: by 2002:aca:c0c5:: with SMTP id q188mr1270836oif.169.1582589658269;
 Mon, 24 Feb 2020 16:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20200220060616.54389-1-john.stultz@linaro.org> <20200220124927.BB33124670@mail.kernel.org>
In-Reply-To: <20200220124927.BB33124670@mail.kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 24 Feb 2020 16:14:07 -0800
Message-ID: <CALAqxLVFHCJfKbDaSC38MMsi_zbn-61Kz4AumxEXv+cCp69Xjw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: dwc3: gadget: Update chain bit correctly when
 using sg list
To:     Sasha Levin <sashal@kernel.org>
Cc:     Pratham Pratap <prathampratap@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, Yang Fei <fei.yang@intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jack Pham <jackp@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Feb 20, 2020 at 4:49 AM Sasha Levin <sashal@kernel.org> wrote:
>
> Hi,
>
> [This is an automated email]
>
> This commit has been processed because it contains a -stable tag.
> The stable tag indicates that it's relevant for the following trees: all
>
> The bot has tested the following trees: v5.5.4, v5.4.20, v4.19.104, v4.14.171, v4.9.214, v4.4.214.
>
> v5.5.4: Build OK!
> v5.4.20: Build OK!
> v4.19.104: Build OK!
> v4.14.171: Build failed! Errors:
>     drivers/usb/dwc3/gadget.c:1098:12: error: `remaining` undeclared (first use in this function)
>
> v4.9.214: Failed to apply! Possible dependencies:
>     Unable to calculate
>
> v4.4.214: Failed to apply! Possible dependencies:
>     36b68aae8e39 ("usb: dwc3: gadget: use link TRB for all endpoint types")
>     4faf75504a7d ("usb: dwc3: gadget: move % operation to increment helpers")
>     53fd88189e08 ("usb: dwc3: gadget: rename busy/free_slot to trb_enqueue/dequeue")
>     5ee85d890f8d ("usb: dwc3: gadget: split __dwc3_gadget_kick_transfer()")
>     70fdb273db37 ("usb: dwc3: get rid of DWC3_TRB_MASK")
>     8495036e986b ("usb: dwc3: increase maximum number of TRBs per endpoint")
>     c4233573f6ee ("usb: dwc3: gadget: prepare TRBs on update transfers too")
>     e901aa159dac ("usb: dwc3: gadget: fix endpoint renaming")
>     ef966b9d3353 ("usb: dwc3: gadget: add trb enqueue/dequeue helpers")
>
>
> NOTE: The patch will not be queued to stable trees until it is upstream.
>
> How should we proceed with this patch?

Sorry, I only see this change as critical for 4.20+ kernels (where it
started biting folks), but I'd defer to Felipe if he'd like to see it
go any further back.

thanks
-john
