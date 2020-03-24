Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84997190B92
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:55:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgCXKzl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:55:41 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41586 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727095AbgCXKzl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:55:41 -0400
Received: by mail-lf1-f68.google.com with SMTP id z23so1073026lfh.8
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mY1ipmB4vwtFKXbX/dGGkZW3SPZ5qDGK+Wn7pHfx9us=;
        b=brHMOxAsP0LdDd6aC1kVCyaNi9wORh/u1aEZCA9+6bRUTtgvcihyAbCPiNIsx9LgFP
         /7sugjRfLIqc+ksAY92uFemz8+ut6zaWep0MCuaqSaRWbU87oB4eZ7QK5hl95R5GvCnG
         BF8CJTEbL6Ieu8UcUNswVEX3CXpNQlq5iOws9f2WvgvqaE+Lcs+zVNLxUCGcXLx37irx
         rTRQGEl4RlQNbT65iH6n4KXB3L4MFFr2LSbNC+vVSE7pCMfgOigrjqquoPS/lPJjUN4+
         mW4UVLoUHEGxxMZJFAHSmPUoj9Tr3EkSRhyb8F8GY/O7jHHVWXNamMNshFDXXAfO/5xG
         T62w==
X-Gm-Message-State: ANhLgQ1zLg/RRQGuSV0SrJahXD9wYX+M6i4IQXKmPL5+CUE/E2O6/Kxl
        U1bU+VXYSYGcstpkxRHDBmI=
X-Google-Smtp-Source: ADFU+vuNZbUDFv/LjVb7YEjPC79MQsF9uzcppmC4gEk0BZW79C3IKvcIBUqyIonQtmrJjTOUdWkgyg==
X-Received: by 2002:a19:248a:: with SMTP id k132mr16170844lfk.189.1585047339027;
        Tue, 24 Mar 2020 03:55:39 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id f23sm9887113lja.42.2020.03.24.03.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:55:38 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jGhDT-0006gv-GO; Tue, 24 Mar 2020 11:55:27 +0100
Date:   Tue, 24 Mar 2020 11:55:27 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH 4/4] ch341: Simulate break condition on HL340 variant
Message-ID: <20200324105527.GH5810@localhost>
References: <cover.1583520568.git.public@hansmi.ch>
 <5da11e2b99cbf37bf741addbc4c28b9f3658efa2.1583520568.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5da11e2b99cbf37bf741addbc4c28b9f3658efa2.1583520568.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 06, 2020 at 07:00:45PM +0000, Michael Hanselmann wrote:
> ch34x devices of the "HL340" variant don't support a real break
> condition. This fact is already used in the ch341_detect_hl340 function.
> With this change a quirk is implemented to simulate a break condition by
> temporarily lowering the baud rate and sending a NUL byte.
> 
> The primary drawback of this approach is that the duration of the break
> can't be controlled by userland.

Hmm. I'll have to get back to you on this. Please continue keeping it
last in the series if you end up resubmitting before.

Johan
