Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D10633A10DB
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 12:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238586AbhFIKKE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 06:10:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234812AbhFIKKD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 06:10:03 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF9EC06175F
        for <linux-usb@vger.kernel.org>; Wed,  9 Jun 2021 03:07:54 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id x18so24750943ila.10
        for <linux-usb@vger.kernel.org>; Wed, 09 Jun 2021 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+fwi5iNQrwpu0AXhB4qjB8fMWEX2xn00/1BEJAzcUAc=;
        b=YUAA7Knce645yrcJQ6rJ8ALhROvtJBnHpkeGwlrgJXcmVEpd3RnNtyWOrvDAXejpck
         xJYM9eSqatkhpI0qQHZmntyXh4ICSOTjNOzdi2R7CfGTfwcp/F9pzXR1wgnenXnd7HZb
         +nzJQwj2SEAcyTNPQ8tgVuq3V4xbNQb2ygzvVs3LFH4LRf6iFRluCovLyqcELA89j7sc
         oFxvlwxRIhVRoAjPw0AJIN5S73bN0+oYGofxKgBrB/AjwD5Y1yPMEf2hyN1ZV48cQqup
         rNVvuImA6++qpK8m8CMOUZZ4rz1ISBaVAbN87FTL2awMU/Z/1bme6uQo4IcWAqFfBL3X
         2tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+fwi5iNQrwpu0AXhB4qjB8fMWEX2xn00/1BEJAzcUAc=;
        b=TR1FB47RnhfDdihypndOqioAfrrUT9mL7mGfiZHKUvaF0sg049k7WQjyz16ITI3z4B
         mJt8731XTmjewrqRFzLjCubT8/oGfpjMEUyp3sMvr7mve7oXYwkPUWmBgZk+2WLI9Jhe
         fJjbqMD7tFnPwWYzAwb53ufoMrhB7yQnFTTY5VzccmrTQgbte3rtslTdzHkg0BCI3vgG
         Am1Q8HMgPoyEV2rg7qjZDO0dNNRdoPhcx4tLaqfvnt4hdaFowY1vzlJbO+64rmkbT+r6
         fp6+695d8pAdo2AgKl9cat5aMoPo3O1Xd80ryOGDXeg0FFBv+cwaOBwflngiBD0F/WL1
         lQLg==
X-Gm-Message-State: AOAM532UROLTjQNgyxGFfHHwweLI64H8j6ofmW1BHzCo/5hbbokk6GfN
        eWpCnAaHEMtToLD+CTXe3qdM85Qd39Wyt9HRjqhj7YNuEObsAFgcsiM=
X-Google-Smtp-Source: ABdhPJwyrCKw6/S3tf+2gQ7u635lbRlt7ScaAd6XW5yDzKh6xc8sUXMyoqzXKgsXQObSmcOSlL/nx8luAMW/UyVmMEE=
X-Received: by 2002:a6b:c386:: with SMTP id t128mr22260211iof.65.1623233273682;
 Wed, 09 Jun 2021 03:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210608162650.58426-1-marian.c.rotariu@gmail.com> <YMCDyCgwOaTBKg9f@kroah.com>
In-Reply-To: <YMCDyCgwOaTBKg9f@kroah.com>
From:   Marian-Cristian Rotariu <marian.c.rotariu@gmail.com>
Date:   Wed, 9 Jun 2021 13:07:42 +0300
Message-ID: <CA+i-z3XHqsSBb6KC-Y0hvQqk-u2O07B-jrp836FL2Z=woHe_uQ@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: ep0: fix NULL pointer exception
To:     Greg KH <greg@kroah.com>
Cc:     linux-usb@vger.kernel.org, mircescu@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> How did you create this?  It's one level too "deep" for git.
I forgot to rebase it on the adequate kernel repo. Sorry for that.
We use an in-house repo where the 4.19 kernel is inside a directory
as you could see.

> I'll go edit it by hand, but next time be more careful.
Thank you!

Marian
