Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD8E717B1
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 14:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728966AbfGWMGa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 08:06:30 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:27202 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727789AbfGWMGa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 08:06:30 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 45tHGr2hHvzB2;
        Tue, 23 Jul 2019 14:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1563883508; bh=oTWkOx0Cb+QaPts4u90JtF6QnzRQKRd4XDnwKPXj6EE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bKZUjSeX7nUERuL+Y4zDnGm34+njFBd3S50DMm/NFOpZmBjnWryenc0tHValt0HMb
         EiKohS9eIXzyLlCBugrgxf0T9Z4ggLt2hJ9xC8JmMx1So+D2028YaXXB6SLkkmkysg
         gevRQDSq/UD6a9EmrBs8+FfI7zUIjFGHWEsjCq0TaRY0I1kyZ0bEUiwdMyDn4pYBk1
         09LJc6HANS43MA60ryBffFF7ziMmhG1ZF+FouFMgGqPPikPNDhj3UnO7N1URERoFkT
         IlZbQlfmA6UNQoJ7+NFyqMuK7d02MggBvNWoBqoBx4iicqj8OtI6VW/FS07RxT6DbL
         IsFqow5Y7KSPQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.3 at mail
Date:   Tue, 23 Jul 2019 14:06:26 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Baolin Wang <baolin.wang@linaro.org>
Cc:     USB <linux-usb@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH v5 2/6] usb: gadget: u_serial: reimplement console support
Message-ID: <20190723120626.GB14036@qmqm.qmqm.pl>
References: <cover.1563809035.git.mirq-linux@rere.qmqm.pl>
 <0dd7dc4d5135b838d8f0fe98d0a689163cc9dda8.1563809035.git.mirq-linux@rere.qmqm.pl>
 <CAMz4kuKELL_7sk8QBNnpfYGx=j5Fdr+ev0893e1HFY0ATFJZUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMz4kuKELL_7sk8QBNnpfYGx=j5Fdr+ev0893e1HFY0ATFJZUQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 10:18:15AM +0800, Baolin Wang wrote:
> Hi Michal,
> 
> On Mon, 22 Jul 2019 at 23:26, Micha³ Miros³aw <mirq-linux@rere.qmqm.pl> wrote:
> >
> > Rewrite console support to fix a few shortcomings of the old code
> > preventing its use with multiple ports. This removes some duplicated
> > code and replaces a custom kthread with simpler workqueue item.
> Could you elaborate on why changing kthread to a workqueue? The
> purpose of using kthread here is considering that the kthead has a
> better scheduler response than pooled kworker.

Mainly locking problems and single-instance design. The kthread looked
like it's reimplementing workqueue mechanics. If the scheduling latency
turns out important, the workqueue used can be changed to dedicated one
or one with higher priority.

Best Regards,
Micha³ Miros³aw
