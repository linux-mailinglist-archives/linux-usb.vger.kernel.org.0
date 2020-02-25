Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA0716BEAB
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2020 11:28:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730232AbgBYK1r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Feb 2020 05:27:47 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38345 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730126AbgBYK1r (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Feb 2020 05:27:47 -0500
Received: by mail-lj1-f193.google.com with SMTP id w1so13405601ljh.5
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2020 02:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lbzZWQunTi9MD+ZgPB4Io+JSc9p53FVTTStQ3ejc8XA=;
        b=Noxb0wPF3gE62pDXypRuncOU2I5tQbuvsDPYzkkXqtZ/pAQDIvdT2xhj9lCZVWzOY0
         oVRxeOctTzZiyuaG6eP7eidfCAqyQvI8idWmbFHqNJHPx0RdFN6OXsM4Yp+DlnotRarD
         GiwalQElmu+jcc5lLbnKOF19KV6dDR1FOEzAZ1L9XcMtajo9F/zh0b8ygOhY5wYetKj/
         JMpDzE8zw8j+wWEsl7i/9UaLth2FFQkNPpgIJBEWSq6eVLbhWT06+ku2H5objHkAe2T/
         RM0Hy5gq+tQeqavlkIFADvgBXddX6O7d7bVy9iSKzDW5z6O7mwKZmVt4fBCSp3GqepUi
         GMiA==
X-Gm-Message-State: APjAAAV2TvzOmfG1jyBH5yZCe3Pv+e+dMKM5Gm2Yq5FnUVL1wBpPJpSx
        03lndG1GlHDczxEYzVHfRwSOSJsO
X-Google-Smtp-Source: APXvYqwqRXIjHbqOEOtPaKBGRSMfPa2t47D01tEiP1Brb9E6t5Wo0IzeRoHXhHl6110DtteccPBqug==
X-Received: by 2002:a2e:9dc3:: with SMTP id x3mr33963671ljj.257.1582626465536;
        Tue, 25 Feb 2020 02:27:45 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id j6sm408126lfk.88.2020.02.25.02.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 02:27:44 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j6XRF-0004sG-5O; Tue, 25 Feb 2020 11:27:41 +0100
Date:   Tue, 25 Feb 2020 11:27:41 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] USB: serial: fix tty cleanup op kernel-doc
Message-ID: <20200225102741.GR32540@localhost>
References: <20200225102421.18262-1-johan@kernel.org>
 <20200225102421.18262-3-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200225102421.18262-3-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 25, 2020 at 11:24:21AM +0100, Johan Hovold wrote:
> The tty cleanup operation is called with a struct tty as it's sole

I'll fix the 'its' typo when applying...

> parameter.

Johan
