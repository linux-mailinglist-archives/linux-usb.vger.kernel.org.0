Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF196A5ACC
	for <lists+linux-usb@lfdr.de>; Tue, 28 Feb 2023 15:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjB1O1Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Feb 2023 09:27:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjB1O1X (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Feb 2023 09:27:23 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDEC2D16A
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 06:27:16 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id cp12so5107858pfb.5
        for <linux-usb@vger.kernel.org>; Tue, 28 Feb 2023 06:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677594436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+PJWjErursWS7lPzmdUOq3whFH9w1ZioVPafChr0k/4=;
        b=aLAbAxuC0QTbnvqDyecUS6b478LEgIzk/oDbONzAwcwAGWHNQNTrW31W4a3igDnB6f
         R7UuE/Yxj2kccPGOzv5izRbWVjBt6U8yYtFNCsgIaUElaENFqMDKHalf9lX6JJjH+AB5
         K7i06FB2tbY9hkMCviwQ83cfYx288O0swzmyHy6la54YyjJpjAJ9VQMlskFXpjeYSZzk
         ErwS+3vxlbTKFhbuifBDQweDXeSSf8L89g+3b4cl2RR35FUVnowYwe8EftMFH92naOnr
         KGOTosxdxB3iTrVnqtYF4VY6I0o9H75c3SI2X4xGHRuRIfGK296F4UY95QKLjI25s+oA
         dkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677594436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PJWjErursWS7lPzmdUOq3whFH9w1ZioVPafChr0k/4=;
        b=keKa094B0XWCcrt9k3KjRHzcrJNf1lVFNmzevN/oiQxJS7r05AMtYPu8pHKztKXDii
         aiuZ1nosLFAA8x9lyId3i8Gni2gEYzo8TAjK2U+pvwikLWfdlXLxc33Y+1bMcwdjF5t4
         VWRkBOgmyUnPiyvCsFjDdfRkNduUGqmBIWC7/AZeJpbenK9Fs4/ZlgFGISxJ8rwiODLN
         vLE9s0nzWGHJdGOE/u2gt+RbjpKAPeTm1Gnc+WqrqCYSr4QsDxvMccnz6z1s/ZcGiDfX
         mL1PP2GnrhkLP/vGjUsqU7Z0ioLRtxHTAdJeqhGVp8hxzTBYqgYKKwTijB26ZdB4cg7V
         wyAg==
X-Gm-Message-State: AO0yUKXmnNMn5XU1NdZXFe3IPms3N0ymCO0Yktgwy9bqul/sRGpE5/An
        VIdoaQvE53BfXGGAAz40u8AINatboGWAzStvcarkLxvz
X-Google-Smtp-Source: AK7set8m0f0dX+xzzlU5kSFsqCP0laackFTbIURJEWJDwpwMpUwncTv5Zc0FiHxqq9aPDZ9a1IDq7UDlpcQNSg0/vm4=
X-Received: by 2002:a63:7a4a:0:b0:503:3dfa:ff84 with SMTP id
 j10-20020a637a4a000000b005033dfaff84mr803337pgn.10.1677594436316; Tue, 28 Feb
 2023 06:27:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+JN8xMXu=sVQ2nyR9SgF25fquCZhH43wdsnuvfjDu+yGRv2yA@mail.gmail.com>
 <b13655bf-4a04-bece-71e4-698bfec83e2d@linux.intel.com> <CA+JN8xOOyU8yLJrxnKPwAMhQFKE70rTi=aLa3Adt7Og4dfPRVg@mail.gmail.com>
 <Y/eKwvQAihZYKUos@rowland.harvard.edu> <CA+JN8xOWzo8ugtzyrAeSB5wN7XSxXs1-69kTZyJ-ZSPLTvFx-A@mail.gmail.com>
 <39df1d39-f1f9-ce69-64b8-981b19731d30@linux.intel.com> <CA+JN8xPjqCaHLvh5v9y3pFC0DxNWjBj-3jF0DJ=B1YSddvYGNg@mail.gmail.com>
 <d86ca3b6-6d02-6312-6e45-4ef954ff36f6@linux.intel.com>
In-Reply-To: <d86ca3b6-6d02-6312-6e45-4ef954ff36f6@linux.intel.com>
From:   Seth Bollinger <seth.boll@gmail.com>
Date:   Tue, 28 Feb 2023 08:27:05 -0600
Message-ID: <CA+JN8xODw08Zra7sUb5farQjYVgH1JmcXhP4unT6fKZQpVWB-w@mail.gmail.com>
Subject: Re: HC died
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        sethb@digi.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> Ok, thanks, seems that aborting the ring does not work either.
>
> When you earlier bumped the command ring timeout did you notice if
> transfer TRBs for other devices were completing normally while waiting
> for the address device command TRB to complete?
>
> If so then it could make sense to just increase the XHCI_CMD_DEFAULT_TIMEOUT
> for the address device commands to 10 seconds
>
> This can probably be quickly tested by moving a USB mouse while triggering the
> address device timeout.

I guess I always assumed that the other rings kept running.  :)

I just put it to the test, and that assumption was true.  The other
ports appear to run just fine (as long as they don't need to use the
command ring).

>
> Thanks
> Mathias
>
