Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD6C272B96
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 18:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727969AbgIUQTQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 12:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIUQTQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 12:19:16 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E91A1C061755
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 09:19:15 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d4so79203wmd.5
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 09:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:to:cc:subject:references:date:in-reply-to
         :user-agent:mime-version;
        bh=+aVVvXzUFdVZdOrIpKJit9DGGPVqWMLgWre5iCirSqg=;
        b=ndQ1hXnqPYPf0fB4FBjdXE2y7hTTtoCEk6MD6GQ7EK4XB/igbcajS+gOkIhgHuV1u7
         UNMzFYoEdsx7C8fbCxaxhMQ2Paz7AE+C0WfouVv5t+YdSQA73a22P9knIJjGjnS4A7Vf
         EB0Mkw5TzEnx6QEd6yEVutqaIA3v81ykjJtGY4wn9rwqNxKhShkUqsjGFagpxiSNqzth
         MQRW/SFhBGzeUjmOhEH+tHY2A1aRp5KXUcJykhzo9SAuLV0G9aB5O2Zo2HIkClMvuyZd
         TF0h1vWyqyjMeITJf9RgcOJ1EjyujuqlHU2HIyk2ccuk6CCoiegIZUK1pO8C30rgaDi+
         5hEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:references:date
         :in-reply-to:user-agent:mime-version;
        bh=+aVVvXzUFdVZdOrIpKJit9DGGPVqWMLgWre5iCirSqg=;
        b=BTdqsqf0CpiC36jKlDANnZTtJBky/WCTnHZRBNo+QGAGqZanVy1wcVMHjBBLeVqQrH
         +Py+63rEzitSY8PvtjP55shLDq1Grxq7TU6Q+zmMzGqJ5vM8ZhuIIf/o2Yr8d5Z6e7tP
         dt6ZKn75zALXgw6RRoOl4VNfUQ4glDbbb/gmkyNyLlnU1jufgxNyupc7wz4WYPOQD+aw
         qoC0Nyy5YjOMeBnNLvaDfH3eOnfhjHbsoQkCxC69zBfpkR0hN3yqlEoporyPWlwc/LQk
         rjuM4EZHf0wPZh6x18tuRjYokaX97q38ezT8lTwMMR5FEuxzMZXkI5FfhX0hokboO3Zz
         c3Tw==
X-Gm-Message-State: AOAM530NFBIlDVptEiqs1jyC6XLYtxgFuiUzcxYQuIoLQrOfh0Wj/6tv
        pEziKTZ60FceTb3D/16X2fg=
X-Google-Smtp-Source: ABdhPJy1TxOlBHsmKJrqkJ0WaYHKX6s5pG1rKfHjX5JS9zI6n1RVtNfcWleVdx8Ho2HMBsVMuYGKqQ==
X-Received: by 2002:a1c:9cd3:: with SMTP id f202mr168705wme.148.1600705154619;
        Mon, 21 Sep 2020 09:19:14 -0700 (PDT)
Received: from daniel-ThinkPad-X230 ([2a01:e35:1387:1640:1853:cc4f:48fd:e3ca])
        by smtp.gmail.com with ESMTPSA id h2sm22476048wrp.69.2020.09.21.09.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 09:19:13 -0700 (PDT)
Message-ID: <5f68d281.1c69fb81.86428.99fb@mx.google.com>
X-Google-Original-Message-ID: <87pn6f5chr.fsf@gmail.com>>
From:   <f1rmb.daniel@gmail.com> (<Daniel Caujolle-Bert>)
To:     Johan Hovold <johan@kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Subject: Re: [PATCH v2 0/4] USB: cdc-acm: handle broken union descriptors
References: <20200921135951.24045-1-johan@kernel.org>
Date:   Mon, 21 Sep 2020 18:19:12 +0200
In-Reply-To: <20200921135951.24045-1-johan@kernel.org> (Johan Hovold's message
        of "Mon, 21 Sep 2020 15:59:47 +0200")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan, Oliver,

   I just compiled and tested, everything still works.


Cheers.
---
Daniel
