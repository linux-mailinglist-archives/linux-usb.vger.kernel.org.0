Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 528FC1AD322
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 01:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbgDPXUp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Apr 2020 19:20:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgDPXUo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Apr 2020 19:20:44 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BD3C061A0F
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 16:20:44 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id j14so194920lfg.9
        for <linux-usb@vger.kernel.org>; Thu, 16 Apr 2020 16:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rwrucZy9DBHBBcljOcNHP/6pKSxYd/iAqAkn7/H5AUM=;
        b=sNpUQlj0xhDPC6oZ6OHCP8qpvA9c7K7MVw/nIvc13YSdP12pKI8wGmIiOFp0x2vGVd
         UT5DL1OAZfUgRYoOjqxDn+OQinyd280v8aQVo2J3VXIPhiTgzWvWJnQAWx6oN/7MIPoU
         ElUHEhjfhRmFcLStYVypHZdciW5UMKyvRByZbYOYTqOW4iQLecD2AYNhyg991yCqwUAf
         k0iuR6nNhqq0+8S/bW4YkLa9V+Ho73ur5ILVUQL2zYA/qi6jq+zLfcYC0m6BWICLXh1F
         UcEVxub6Je+s/FFgDp7QjxxT2pg5WZpU9HbF/Ge49bNKUtC6XmAF697GW5/CAneQyc7I
         7VYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rwrucZy9DBHBBcljOcNHP/6pKSxYd/iAqAkn7/H5AUM=;
        b=of2B2b4GJn7K9ZhGTt+v8zXQ+BDrWJZEOjYAXb29PPR6CdsOojWE5mPtPMtSZjwZiZ
         n1Kd5329MIfNGf9PDHDCHJjGVoHsRe8GYQ1II/fiCX79g74JqiQ75YpymRBrbMeqd+A/
         q6Bbu9V9AeRXd4JBe2bBtC1kKwIQxH00iFp+tA61Gebrbx3Yt8kVMgcK+ygXfTbZUXIc
         N3VehFoaFsIdPpKRmt4UBgjhEKY5EvwLk6brprfBEZz2TnRtdPV2ZZL9djks1IquKMPD
         1LzmjEfGc1Ym8ZwrVlLSmyr9uBnOo3XAEKnUHO82u7P0TPxkDBZZvSsh47VSQTCDpd3f
         O8bg==
X-Gm-Message-State: AGi0PuYkQp7lF/RjQ/F2ft1IRklexKkIyFDeJ+4ameqydLLC1LfqSta0
        iv25MvyiCDAiil9ldQZyGMgXAr5Y2GiJvHPgXt7LYHW56sQ=
X-Google-Smtp-Source: APiQypLzNKExbOuNg/PYEDGFn3yqZuiuigG9qn+j/eUrgjK7XWg4Z31cqzDTZU1fjg49hUJbbRG/YZGGcFoZ5FZHJAU=
X-Received: by 2002:ac2:4213:: with SMTP id y19mr127683lfh.99.1587079242764;
 Thu, 16 Apr 2020 16:20:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200416120146.54791-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20200416120146.54791-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Fri, 17 Apr 2020 02:20:26 +0300
Message-ID: <CA+CmpXuEbpATXSw2x0sH4LWU9XAm8d5ZpkDm9Kuoi5CwvTZQvQ@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Check return value of tb_sw_read() in usb4_switch_op()
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Apr 16, 2020 at 3:01 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> The function misses checking return value of tb_sw_read() before it
> accesses the value that was read. Fix this by checking the return value
> first.
>
> Fixes: b04079837b20 ("thunderbolt: Add initial support for USB4")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Yehezkel Bernat <yehezkelshb@gmail.com>
