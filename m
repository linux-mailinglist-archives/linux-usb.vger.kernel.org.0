Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF85F204E
	for <lists+linux-usb@lfdr.de>; Wed,  6 Nov 2019 22:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728057AbfKFVE7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Nov 2019 16:04:59 -0500
Received: from mail-qv1-f47.google.com ([209.85.219.47]:46946 "EHLO
        mail-qv1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727700AbfKFVE7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 6 Nov 2019 16:04:59 -0500
Received: by mail-qv1-f47.google.com with SMTP id w11so2047888qvu.13
        for <linux-usb@vger.kernel.org>; Wed, 06 Nov 2019 13:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=TmczYTrjQ088+tX2trA8j99by4pUG8NLh2skyNwARwU=;
        b=ZynbgxMmOU3QP7NADhc/WYSFfM9zbM749h1VzciJNWEpoDURwHHCHePevs9oM+0yYw
         JUNizSeeIidLzmXZOFguMfFKsKduILVUid0MD+ujG1A84EKaF5au+lr3czUVK807/I0R
         B8X/aXTQKMVqurhPNgfBy10zavvXKRiz62Qps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=TmczYTrjQ088+tX2trA8j99by4pUG8NLh2skyNwARwU=;
        b=Ra8TgC1f+w8GfM4mK7+k/fIhQUHEJ1YWVFYrpp/tnEF9s+BSK8oPJVsbjxgPa3LVoE
         tW3X+wblWr1cSbWZ2TeLouYofHr/RJa8AYd2W4SyV9ZlMyVRRMhdAtgsbwQOIqBnSSgN
         CL+/7jQjUE47ja+jhIqS8566H41YoupLIl3WPIgGTe2VeD4xW2z4pBRDPZAE2bJHSkgU
         PYII6ateV9R8b4igKJAzfzAqTNTw1wDUu/c9yFqNbP4ka12t4sw105Fmgt+KV1+e9FiA
         B3bBP6HttpS2jRQBJnTkd+GcmGStvUp0EtCVkAZPcp3KWxOFwiRlyls2H9s5effMs8wL
         Ex9Q==
X-Gm-Message-State: APjAAAXDt6N62FXEBiQlZh9LVDWIOqAZ7pN81OHpZg2yvMSmaf4LN0i6
        AVRngVyr9aRWwAPKn5Q1PAjnOXynWHAXFw==
X-Google-Smtp-Source: APXvYqxrPGNULwobtB6PU6NQssUZV97TVVzlxRtMFz5BmAa+pipwuJPdErbkkyB3Wt894oLyaSdCig==
X-Received: by 2002:a05:6214:32b:: with SMTP id j11mr1228562qvu.98.1573074298044;
        Wed, 06 Nov 2019 13:04:58 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id 11sm67733qtx.45.2019.11.06.13.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2019 13:04:57 -0800 (PST)
Date:   Wed, 6 Nov 2019 16:04:55 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     greg@kroah.com, linux-usb@vger.kernel.org
Subject: Feeding bugzilla.kernel.org USB component to the linux-usb list
Message-ID: <20191106210455.hpe63idbcz3yw54z@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, all:

I noticed that Greg has an auto-reply for any new bugs opened on 
bugzilla.kernel.org for the USB component:

https://bugzilla.kernel.org/show_bug.cgi?id=205449

Would it make more sense to feed those into the mailing list instead of 
asking bug submitters to send a new email? Anyone responding to the 
bugmail sent to the list will be properly recorded in the bug comments 
(and if they don't have an account on bugzilla.kernel.org, a stub 
account will be automatically created).

It seems like that would be a friendlier setup that doesn't require bug 
submitters to do any more work, but I leave it up to you. This scheme is 
already used by other projects, e.g.:
https://lore.kernel.org/linux-xfs/bug-202349-201763@https.bugzilla.kernel.org%2F/

You can see Dave Chinner replying to bugmail directly and it being 
recorded in the bug entry:
https://lore.kernel.org/linux-xfs/20190124233132.GO4205@dastard/
https://bugzilla.kernel.org/show_bug.cgi?id=202349#c7

Please let me know if that's something you would like.

-K
