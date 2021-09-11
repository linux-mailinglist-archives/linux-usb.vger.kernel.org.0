Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4C640753C
	for <lists+linux-usb@lfdr.de>; Sat, 11 Sep 2021 07:44:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231536AbhIKFpP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Sep 2021 01:45:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbhIKFpO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Sep 2021 01:45:14 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B91C061574
        for <linux-usb@vger.kernel.org>; Fri, 10 Sep 2021 22:44:02 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id l16-20020a9d6a90000000b0053b71f7dc83so5329828otq.7
        for <linux-usb@vger.kernel.org>; Fri, 10 Sep 2021 22:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=uw3Jcx9FvOKxcB8V9zigtl1nqlEYmKGQcJUOFoXjOq0=;
        b=L961bxY70NpuOvRGM3uuwoWheEfh6DFMFMvOxxUYe8gzctwUY7SxSavSYzLsmLQNsF
         ETkSOpdQa/we0tQlr0eclTUzviMoOOLr6jhjNpbMArH7N0PVNJB8F45CZuhsrDa3LIpL
         JbkZe5iqG7BKjNRmASmT/fM1CnhWHyUgpNqeDlrhGIjRz+dhd1Gl0/gZrApBw6RalryY
         wV3ILg34KVSmGclmdPyPJIFAtDUr6rfMuf3TeBHgYYEvqX0OFnHrkuWtXv3fOPIiuFbB
         H7CyGkCrJXlqqz2o80rJQQfHRvqEm8ackdGSaSdvdmzLKKoEZ94D/RihG1G2+CJjcCL/
         Q+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=uw3Jcx9FvOKxcB8V9zigtl1nqlEYmKGQcJUOFoXjOq0=;
        b=LwPu9uI0h35sWOVnQKT9B9dBIhEJA3PHue+GGOFRN+t0CpDVUaLIvSNRoJkdeuOVea
         EjnYsU1BMJodp3XNcGqlxKOP83kqi/iKbux5cV2DKDd19HtlOnkHkmhxGcxKp/G9dxRu
         lTLN+2y4GYz9hOdctfnMmpqgzagmYr1cE1K03Bdgk6PgfD3KRqE6SvnaVZjk+r4A+b5R
         iZsRHrYDpNs4kKRwJW0g1PT2ulq7UfGe0GmThGXZxusVMF1z9ytmGHOHWYl3BTu3C9v/
         bmhmluw9UBd1fJ38oaLKVIYUnQNwMv1D+jEhjv74u1hgbELJPT2isiREmeu191qky5Gd
         mSag==
X-Gm-Message-State: AOAM532SEb556fp+yqB8CkY4qr307HtmNYvS0hJt71yd77ZuFZoephE5
        GceS02QvhFYMtPjq4JFN827imZSehoL6ukbqpa5cu9E4KVijMA==
X-Google-Smtp-Source: ABdhPJy0vt7To+4Ln+M/n0NKoLAi6HImdV6zE86Tf7VU5FVWUcytE5CdYkJ6w3jVjo7vLi4OD/OXyfgwUuzJl8I0kPw=
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr1048392otq.351.1631339041134;
 Fri, 10 Sep 2021 22:44:01 -0700 (PDT)
MIME-Version: 1.0
From:   Ajay Garg <ajaygargnsit@gmail.com>
Date:   Sat, 11 Sep 2021 11:13:48 +0530
Message-ID: <CAHP4M8Vc+0eChmJDnLLa3ibuzGLOnc5hJ1Nk09794RHEJ7tEPw@mail.gmail.com>
Subject: How to register a new "function" in configfs?
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi All.

As a first step, I have been able to load a gadget on configfs, which
binds to the function "gser" (thus loading up the usb_f_serial module
when the gadget mounts). Things work well till here.

Now, I have written a brand-new gadget-side device-driver, trying to
create a new function "gusb", via DECLARE_USB_FUNCTION_INIT.
However, now when I try to load the gadget for binding to "gusb", I
get the error that the function cannot be found.

Seems that firing up a new gadget-side driver, that registers a new
function via DECLARE_USB_FUNCTION_INIT, is not enough to make the new
function visible across the kernel.

Kindly let know what I am missing.
Will be grateful for pointers.


Thanks and Regards,
Ajay
