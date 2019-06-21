Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFD14ECA5
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2019 17:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbfFUPzu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jun 2019 11:55:50 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43081 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbfFUPzt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jun 2019 11:55:49 -0400
Received: by mail-pl1-f193.google.com with SMTP id cl9so3191058plb.10
        for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2019 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:references:user-agent:from:to:cc:subject:organization
         :in-reply-to:reply-to:address:date:message-id:mime-version;
        bh=j/5b+1va8b2wxiZpX+2Xc3KIkQiBsuWwHD6BonNIDXM=;
        b=e4GdKJfYhIlEmQBtEDsjMFe6/PegeeQTw52QZLELVw8KCJhQXDab+Bh6RmvPsY9OXJ
         8kuUuljYcTXngsJ8GbEhQIiEebtCOjg8ySR7mdxqfLTGq5DF7NVjmZVCYRzvnIRkjiDl
         2wupxWUbJ0ii5HTKdVvna0Fgt7Tbikui7LLwV4rUJIT9M2V9TOi+ZB5dhlYA0kivsqjG
         /NpzlcLrMihUEDMFSBm6e1HBYRHEKT6r/jD2p0ThmmIN4YT+cIzaM01QHc8s/+WO3ZRt
         VE6ZZrIASbNzxtu93RKKigYJw/DsRCT4kGQMCHhEK1xTk7CfdP8f0Aokque8XUGIk96h
         7SiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:references:user-agent:from:to:cc:subject
         :organization:in-reply-to:reply-to:address:date:message-id
         :mime-version;
        bh=j/5b+1va8b2wxiZpX+2Xc3KIkQiBsuWwHD6BonNIDXM=;
        b=RnG2WHXPXr+j/lcElY83Ci7OxAtIsZkQ4UGNhXb1GgM3Kv7NN0CwYnkScKBUg4JcCK
         HNiy+Cy1MnLnreYY9O0facTGdWqOeGulO8BeaskuncvVQwPrFPhnW1TZ4YNNi6qNp47B
         2YLEZhYKc9FoFEyRA2q++Fp75DDSMVEiC/VNn8baIAzcosc/S7HYW3jsKgYOZmt/NYH1
         YCuwy0fERnbhHZyL1ZL1D2hKSGzbhElSA3WiEKMEDg/7K+SX2sW+AT0jio3kmdQoDSEO
         YKGRFsqOVMzjSB8YeE/5/h7waRpJjcyCR/esKlP5aYV7FzkZ6ORkatPaNQrbcQwcyViN
         pTFw==
X-Gm-Message-State: APjAAAVZzui8ApJGtcOuSh7GC0dWvgeaiTILoNXZn2DRyZM6azG1+U3E
        sKxOfSYvARxw3W4lt3FGVvxqzMI1IpY=
X-Google-Smtp-Source: APXvYqzyT9g6CR5WlFxWqchh2HIiTAB0VJQXwgLVUHKZW+1HExoHooJfq/8FNxg65oQgf3x46BzsDQ==
X-Received: by 2002:a17:902:2ec5:: with SMTP id r63mr55411734plb.21.1561132548986;
        Fri, 21 Jun 2019 08:55:48 -0700 (PDT)
Received: from mn.cs.uvic.ca (S01061cabc0a516f3.gv.shawcable.net. [24.69.190.94])
        by smtp.gmail.com with ESMTPSA id p3sm3096442pgh.90.2019.06.21.08.55.48
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 21 Jun 2019 08:55:48 -0700 (PDT)
Received: by mn.cs.uvic.ca (Postfix, from userid 1000)
        id 7A3734650EE; Fri, 21 Jun 2019 08:55:47 -0700 (PDT)
References: <20190621071655.GA20682@kroah.com> <20190621152239.17559-1-dmg@turingmachine.org>
User-agent: mu4e 1.0; emacs 26.1
From:   dmg <dmg@turingmachine.org>
To:     linux-usb@vger.kernel.org
Cc:     gregkh@linuxfoundation.org
Subject: Re: [PATCH v3] usb: clean up some of the computations in adu_read
Organization: turingMachine
In-reply-to: <20190621152239.17559-1-dmg@turingmachine.org>
Reply-To: dmg@turingmachine.org
Address: dmg@turingmachine.org
Date:   Fri, 21 Jun 2019 08:55:47 -0700
Message-ID: <87o92rrkzg.fsf@mn.cs.uvic.ca>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



dmg@turingmachine.org writes:

> From: Daniel M German <dmg@turingmachine.org>
>

Sorry, I put a spurious line in the body of the email. I am resending.

--dmg
