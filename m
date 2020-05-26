Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC681C3FC2
	for <lists+linux-usb@lfdr.de>; Mon,  4 May 2020 18:24:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729594AbgEDQYw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 May 2020 12:24:52 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:34437 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbgEDQYw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 May 2020 12:24:52 -0400
Received: by mail-lj1-f194.google.com with SMTP id f11so10342573ljp.1;
        Mon, 04 May 2020 09:24:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qtg0/1/Kqnz5TIbV4jR1PgLFwc6UIC5z7n3sJI6oD2w=;
        b=en8JQFm3uaYk2FM8AULfL8IJe1jTNY5qGwEy5dR1AYlwD7bMk6OLRLCENezEs7zabB
         edgxHbJR67ghFWPT8p4KbLT11NzR7AaqzoljkRKZ4FEsohqkCaJYlP99wuruLhizobQw
         V+mqTURbuUWTm/mFSStNaByjN7ThSku9UfFG+DFN/mxxmxYnfqn2rCBn7BKEbwyzvR8Q
         iTTEwq0sPmHJW86IPceb4/rDWUDsRF74alvR77Qj6F/vSPvXMSgXDfRJtPtn94Gh9Qrs
         yjsbB26N9G+Uhpr7awstO72pTVJZ3jIA3BXjQeMXPQES+w6Shu0l/gx5ttBM0JTE5klg
         lrVA==
X-Gm-Message-State: AGi0PuamH5wJSDWBGQ8zGYVqVgaJEDtBx+0UQ+HeViFkrWfjPe7PfNjV
        HPvQIkfrpxlbDtbwM07q+Oo=
X-Google-Smtp-Source: APiQypK+HF5GVJ0Uv4HysbZorQyE9P/38kihnqUZLuH6K2f/pP35UoWGGeev7Iiou3ex4IwK6hDozg==
X-Received: by 2002:a2e:9055:: with SMTP id n21mr10959289ljg.46.1588609489333;
        Mon, 04 May 2020 09:24:49 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id v18sm12880679lfd.0.2020.05.04.09.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 09:24:48 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jVdtd-000555-6K; Mon, 04 May 2020 18:24:45 +0200
Date:   Mon, 4 May 2020 18:24:45 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Matt Jolly <Kangie@footclan.ninja>
Cc:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: serial: qcserial: Add DW5816e support
Message-ID: <20200504162445.GE2042@localhost>
References: <20200502150347.10186-1-Kangie@footclan.ninja>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200502150347.10186-1-Kangie@footclan.ninja>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, May 03, 2020 at 01:03:47AM +1000, Matt Jolly wrote:
> Add support for Dell Wireless 5816e to drivers/usb/serial/qcserial.c
> 
> Signed-off-by: Matt Jolly <Kangie@footclan.ninja>

Applied, thanks.

Johan
