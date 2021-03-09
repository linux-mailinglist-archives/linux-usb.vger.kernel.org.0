Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F072433234F
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 11:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCIKr5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 05:47:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhCIKr2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 9 Mar 2021 05:47:28 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A15AC06174A
        for <linux-usb@vger.kernel.org>; Tue,  9 Mar 2021 02:47:28 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id p8so26450078ejb.10
        for <linux-usb@vger.kernel.org>; Tue, 09 Mar 2021 02:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uaHaUprmmFNAnTs4f97fSuZjWpoA9R2q6svbU5FVNyw=;
        b=jjzzfBTZgLP5ZAN2nLjmaDyu94NDpG7zOoKYYXquWQfXOmQ0POdKwtbnNyOm1dEp6t
         Ck2YTwE57d+1ba3zitAh6dzQcRPCUSNt3MhRivQfoZ6hHe6CIWY64WP5QWecE71DOoqa
         hALb7ur/Rek4/1o0kNTggCi+5qN73YUP+LNdDbZQFbFCl8rRFS6ev+GOYjz9i98odL34
         DuYzXrxjRQ4fuYrtpneGiZn5eISC7cc8XkPbnphCfULoXe5VSH/5rFZUv8NeX1ASpzDD
         oM5yyFBtJzHvNqbJFYUPkVQeZC7GZtr2yMkgXZMBRXmcdnXPqQO7399cm0ZKniGmOBkT
         Pqdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uaHaUprmmFNAnTs4f97fSuZjWpoA9R2q6svbU5FVNyw=;
        b=dZcGZlswQPMnNJU/ASoTgBruAt8TFKJ1QJq8ukHgaNLUvYF3gBtm9KP8XPCeCbpVdL
         CQyzKgezxDTrEL80FOdFEMma+miR60/ZN26z0rExjDCi7E48gQaYUnc3eeseTfynTahl
         aFXZqWkftyq77i2kRtHgXQFHivhvGUtMy8sNE0S/po9lHiwX0wLEA0UYuk0/SrFZUWr9
         cHHBpVPfwncbiKmzEXQiXDObeVTZLwK2or0nGiBhxspjdM8uD22HWqbBQA3i2dskfpTt
         hjKbNJaofnEicIf300tpN7a8YXaWUEz24k/LLz+v0MB6GcCbK8h4By7S2/MOV85kbJV7
         KzRg==
X-Gm-Message-State: AOAM531boXAzVhAe1b5gQI7VCZkHqoLDb0IEqMtZ2u3KFwjXAO1dwmII
        RDWeqvJzkRItFDu7rTWRt1+oWTzAJU0gB18hevictpdTouJicA==
X-Google-Smtp-Source: ABdhPJyrQxTEBVZkv8Br//uLVjekH19/pT0HhiNjAiCcTjH0b5kEGQ3L0COJH8DTCVEKSqkISz2terQuq6dQnrjN5E0=
X-Received: by 2002:a17:906:260a:: with SMTP id h10mr19831234ejc.392.1615286847398;
 Tue, 09 Mar 2021 02:47:27 -0800 (PST)
MIME-Version: 1.0
References: <20210309092330.5813-1-gil.fine@intel.com>
In-Reply-To: <20210309092330.5813-1-gil.fine@intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Tue, 9 Mar 2021 12:47:11 +0200
Message-ID: <CA+CmpXuyRMdxHi5EkOhhQqOc0gu5c0ZV+GCuCAXeH4_4hRHvpQ@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: debugfs: Show all accessible dwords
To:     Gil Fine <gil.fine@intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org, Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 9, 2021 at 11:22 AM Gil Fine <gil.fine@intel.com> wrote:
>
> Currently, when first failure occurs while reading of the block,
> we stop reading the block and jump to the next capability.
> This doesn't cover the case of block with "holes" of inaccessible
> dwords, followed by accessible dwords.
> This patch address this problem.
> In case of failure while reading the complete block in one transaction,
> (because of one or more dwords is inaccessible), we read the remaining
> dwords of the block dword-by-dword, one dword per transaction,
> till the end of the block.

Just wondering: is there any chance this will slow down the device adding flow
if there are many inaccessible dwords, or we expect the read to return
immediately for such dwords?  If for some devices it may be a slow process, does
it make sense to have a way to disable this feature for specific devices or by a
module parameter?  Maybe we don't worry about it as it's only for debugfs?

Thanks,
Yehezkel
