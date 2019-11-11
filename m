Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDC3F8171
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 21:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbfKKUkK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 15:40:10 -0500
Received: from mail-qv1-f43.google.com ([209.85.219.43]:44769 "EHLO
        mail-qv1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726939AbfKKUkK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Nov 2019 15:40:10 -0500
Received: by mail-qv1-f43.google.com with SMTP id d3so3857171qvs.11
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2019 12:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KWsJltbq87WWGSx0qLH+vFmnEknVQOYa6Q27qNFO+8M=;
        b=CMBrRIPtS9n+H6ufOEASSmEeOoNx1Rxy2x1KFWPR9VpsJdBsQcrcHb4sjQwKtVpbJB
         jmNsvOXrjRpmLTNyu6m991f5tUMUQfU87cnXEw4yHj6I2cw5dfaOGvBbqGtvj/lEweeu
         i4QwWFwIYl9TJjfYjwTzNSFcxkDvncdZcGxpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KWsJltbq87WWGSx0qLH+vFmnEknVQOYa6Q27qNFO+8M=;
        b=QMvHg4WEfBJIgRhdVyToLvm8pjtkMWGPyVFeOjf7wc9WA1gRptoVEKispkaoqHOsay
         xvWVqVxNFp60zmUPO9x8b9bTQYKB2bHGTJqFEuE5cz1Px33iRtdherYdiaSP/oqYhWRG
         4dVW1d7xIyidiyv1tfH9xw7m9uVKD++ET6vhC12Tz/+8fIFGnMJg76DrLMUjMNo34pjC
         ZXKcM3aDwHomuTXCuVZ6uvKh7uadtBOdz9AifM47muP2hoNxvgKxfEasqJky6gl2/ftQ
         69sfZxVKas7e1MCkXpbFPv+KVzjfoKlrKbfY9zS/SHnIfG6Hp6a87nVuUQH6ENmJfBG0
         hCyQ==
X-Gm-Message-State: APjAAAUcF2p6JsVIfGS4mZMqVuhSBnT5PSMy1TV9Qt6XtajjYslzsnaS
        CAG/n1GCUHgGh4UkWjHrheG7r5eWjhGXvw==
X-Google-Smtp-Source: APXvYqyoZb3k5q87RriSg5gAnRpAkOCvomuszA5915gtYOWcLILQ7xeVlKXWmWk0RsfIWrW4sZ7qhA==
X-Received: by 2002:a0c:942d:: with SMTP id h42mr8783781qvh.118.1573504809266;
        Mon, 11 Nov 2019 12:40:09 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id f23sm7384061qkh.94.2019.11.11.12.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Nov 2019 12:40:08 -0800 (PST)
Date:   Mon, 11 Nov 2019 15:40:07 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Feeding bugzilla.kernel.org USB component to the linux-usb list
Message-ID: <20191111204007.46d6kq53rwpiiv4x@chatter.i7.local>
References: <20191106210455.hpe63idbcz3yw54z@chatter.i7.local>
 <20191109092346.GF1293712@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191109092346.GF1293712@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 09, 2019 at 10:23:46AM +0100, Greg KH wrote:
> On Wed, Nov 06, 2019 at 04:04:55PM -0500, Konstantin Ryabitsev wrote:
> > Hi, all:
> > 
> > I noticed that Greg has an auto-reply for any new bugs opened on
> > bugzilla.kernel.org for the USB component:
> > 
> > https://bugzilla.kernel.org/show_bug.cgi?id=205449
> > 
> > Would it make more sense to feed those into the mailing list instead of
> > asking bug submitters to send a new email? Anyone responding to the bugmail
> > sent to the list will be properly recorded in the bug comments (and if they
> > don't have an account on bugzilla.kernel.org, a stub account will be
> > automatically created).
> > 
> > It seems like that would be a friendlier setup that doesn't require bug
> > submitters to do any more work, but I leave it up to you. This scheme is
> > already used by other projects, e.g.:
> > https://lore.kernel.org/linux-xfs/bug-202349-201763@https.bugzilla.kernel.org%2F/
> > 
> > You can see Dave Chinner replying to bugmail directly and it being recorded
> > in the bug entry:
> > https://lore.kernel.org/linux-xfs/20190124233132.GO4205@dastard/
> > https://bugzilla.kernel.org/show_bug.cgi?id=202349#c7
> > 
> > Please let me know if that's something you would like.
> 
> Yeah, I guess it's about time to just set up the feed to do that, thanks
> for bringing it up again, I had forgotten about it.

Okay, I will go ahead and set it up. You will see a worrisome email from 
bugzilla about me impersonating the list account, but it can be ignored.

Best,
-K
