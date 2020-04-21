Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73C871B1C56
	for <lists+linux-usb@lfdr.de>; Tue, 21 Apr 2020 05:01:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgDUDBm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Apr 2020 23:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726024AbgDUDBl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Apr 2020 23:01:41 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 762F6C061A0E
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2020 20:01:41 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id z6so1935634wml.2
        for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2020 20:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6MHwnGIx5i/I+fp0Znq2DDkyD3t8JtcD1m0k8wywQNM=;
        b=bo+HAFhGaPK0m0il7Wj6KKf8RAoynRWL74mjr9O54bI7an/IgZ2eu3pYhnXNL2kBFu
         /fZvU8cURjwG0Wnau/Bq7sGLhn/0KgbKM8AaqPYGBy/PLClCWGkHpvCRGbktyXWArSxM
         y0nQ1qPhlSrngrxiYUTK46HYtoJ0iN+BSUI0+rpo4PQbCkLG0CIZj36ZHCxc4pBgMrr0
         17EcK6JKz1rS5Ou8lfVgYp0PIVCWZrWhXSP1eE7ivQO3PjvlRzBGYDdhh3NSEvEQqvUl
         ATCYabgwDg6LOY3D7hhz3k9RiQ9HU0YQ9/gR0LfjG+bshRSItLVinPegUP/UwFGVhRWw
         fNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6MHwnGIx5i/I+fp0Znq2DDkyD3t8JtcD1m0k8wywQNM=;
        b=LivbAecVw2YT6F35yyyNJZB4li7ol0GC4ZQMKNFF0gUnVsdYpJzjlizQ7U8T7ocPMG
         jzBBkEubuKEt0wZDmtSaylFO06yRxH3C5y/lJlg2Cl73KFt+fL2k/MGzF4nKA1V5o0RE
         YOkCpXoEaD29mihWzNfJwWOO+8sn71DkNzxLRU+JeeWfcrb/m+E5uiVQgWFlQtW9+Gls
         FMUTlwDK3+Uoq1pcsb4Lf2ycTFeafX10fFk5FFcd4wwRnjlv3P5aBjqVBdnLzXzp+aYH
         JLpgdj8o+SBnuPyZYxEIIF/V/mPt5Rzp0E4TQ6l8BjmFKRVZdkX6i/snQAuL72oz18H3
         CjMA==
X-Gm-Message-State: AGi0PuZuRCuqjM1jQHTzdnG8Y/PISK9q+cj6W7ugA8ods4f8jQFskD2R
        Y8lLWcOP59wN1TUQYV/Si2U=
X-Google-Smtp-Source: APiQypJyaTjPjsLkWpwQRUXOL7wG5LmQWrq9EMUI5mfsnzDthFjeGjpCtO99kLdhxaqxtfwvWG2yWA==
X-Received: by 2002:a7b:c4c9:: with SMTP id g9mr2378406wmk.171.1587438100200;
        Mon, 20 Apr 2020 20:01:40 -0700 (PDT)
Received: from Susan (91-164-97-136.subs.proxad.net. [91.164.97.136])
        by smtp.gmail.com with ESMTPSA id f63sm1539413wma.47.2020.04.20.20.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 20:01:39 -0700 (PDT)
Date:   Tue, 21 Apr 2020 05:01:37 +0200
From:   Cyril Roelandt <tipecaml@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     USB list <linux-usb@vger.kernel.org>, sellis@redhat.com,
        pachoramos@gmail.com, labbott@fedoraproject.org,
        gregkh@linuxfoundation.org, javhera@gmx.com
Subject: Re: [BUG] Regression in Linux 5.4.17 for JMicron JMS566 enclosure
Message-ID: <20200421030137.GA2492@Susan>
References: <20200417220957.GA4707@Susan>
 <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.2004191144550.4266-100000@netrider.rowland.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On 2020-04-19 12:03, Alan Stern wrote:
> [...]
> 
> Below is a patch which will tell the kernel that the JMS566's FUA 
> support is broken.  Let me know whether it fixes the problem.
> 

I applied your patch on top of v5.4 and was able to use the enclosure.

Thanks a lot for your help! I am glad I'll be able to keep using this
enclosure instead of buying a new one.

Regards,
Cyril Roelandt
