Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA1C270018
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 16:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726402AbgIROqV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 10:46:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgIROqV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Sep 2020 10:46:21 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 598FAC0613CE
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 07:46:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so5579672wmi.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:to:cc:subject:references:date:in-reply-to
         :user-agent:mime-version;
        bh=pt+pzh7rCa043zhBBlncBvc7mzWdzBXn0fCVEqFeLxI=;
        b=J018ZM9ofJtBbOPDgb69oz0r4nCjS/5ZQtWK/h8XhxfhQMROgqm28JmdAYD1ZAwYwR
         GKTyGYfXAj+c0Mg2YTb6G14MACu+ZpwNKipErk6shupC84Dj1a+qjjBJ4qAIjEqSkwEe
         +sBiSwHYb2fFl58wL9FYeg8Qt8PGb8wEhq2UQ5wpKPp+P8vI39MmqyLVew0T9TZYesM/
         J75dNZkGeagzkxKyLyHt5M+IZzwPXfjaaf2ju0OBdw+AoXaVePFW4saQEtw1IMX7FEOf
         qR18har7bWDD9SkgCYeuAW4iwT06wzD87C66AEPr7XJUb3nGW5lfxLx1CJHALo2F3Qxg
         HbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:references:date
         :in-reply-to:user-agent:mime-version;
        bh=pt+pzh7rCa043zhBBlncBvc7mzWdzBXn0fCVEqFeLxI=;
        b=Lt/FCknxCIqGKnnoPxg2lrg00O4vtDkMSXiIoEZSiTLZZ3qPPR8qBAiH51pFhDPp7h
         BLVjWf8p2hX4+Kuswmmin958Gr34u10qSEZvxX28NXK8EvPjehXEfOO3kx/urVlTaLGv
         BU/o1iGBUl+E4cgeJUfyrLhuZSJ02ebmpbtTLfGD2WXygp/XhK82dCbE20XlND6nYdqC
         eS67tyy1SkMxgI2PC5CdO0ld99CFeYmi+efnGu6qMS+HiW2MKVz3O8wxkXRyx54w52MS
         pfU6yriy7iq8cZrIm1QY7xTrzZjoscFq/QHIoidU+ddSiiV0nIYv/IuLzNRc85s/9r1L
         IXYw==
X-Gm-Message-State: AOAM532v66QKlKArEwun5Pweqx9NPQf9nscNYCpP2BrjKaWfL/XIfe6C
        zDJYaY6SwLr+nK73hnJWugybzcecSbrERg==
X-Google-Smtp-Source: ABdhPJwFXFe2jPXBYtn1nEQty6+6h4QdQZpKTqMFWCdXoooSTJoq/aoLY55JhRdztEDjBmbI9T9ESA==
X-Received: by 2002:a1c:6187:: with SMTP id v129mr15792670wmb.35.1600440379825;
        Fri, 18 Sep 2020 07:46:19 -0700 (PDT)
Received: from daniel-ThinkPad-X230 (lns-bzn-35-82-250-215-35.adsl.proxad.net. [82.250.215.35])
        by smtp.gmail.com with ESMTPSA id j7sm5620400wrs.11.2020.09.18.07.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 07:46:19 -0700 (PDT)
Message-ID: <5f64c83b.1c69fb81.7e806.e269@mx.google.com>
X-Google-Original-Message-ID: <871rizywg6.fsf@gmail.com>>
From:   <f1rmb.daniel@gmail.com> (<Daniel Caujolle-Bert>)
To:     Johan Hovold <johan@kernel.org>
Cc:     "\<Daniel Caujolle-Bert\>" <f1rmb.daniel@gmail.com>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-serial-simple: Add Whistler radio scanners TRX serie support.
References: <5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com>
        <20200918074519.GN24441@localhost>
        <5f64b2cc.1c69fb81.67f97.d907@mx.google.com>
        <20200918143746.GC21896@localhost>
Date:   Fri, 18 Sep 2020 16:46:17 +0200
In-Reply-To: <20200918143746.GC21896@localhost> (Johan Hovold's message of
        "Fri, 18 Sep 2020 16:37:46 +0200")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Yes, sure you can add it.

Thanks again.


Cheers.
---
Daniel
