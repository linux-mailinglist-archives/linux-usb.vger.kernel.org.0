Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4C9190B4C
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727234AbgCXKlq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:41:46 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45809 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgCXKlp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Mar 2020 06:41:45 -0400
Received: by mail-lf1-f65.google.com with SMTP id v4so9072297lfo.12
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2020 03:41:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wqpD+wYNg1xqV0IVCC+VXA7Q+S6Q/yvjEmfajK9iKuk=;
        b=Cem/XEQlDDsBzNFXQd5uCkUU5iQvD2AGpqr8UlsUTuNueEryoJdmEsPNT0uN08JnO6
         BwWuKGDPUXq5OheYq+0zoNvoQZUKkQNIerk7BrsqkmKLXh5/S6eYIPZXaO13vpQhPrlp
         /lk0X/KRSQfqW5LHp6q29CcOE/rAP4Yx7Q31brN7KZxriiAWBaWrGXfAL9w32xxc1dis
         AI632TmF+BJisLjZFSkCT5nrG+yDLq/uBIBaunjrMoWmCPWTe7wswH3/uRLxaRKFmPwF
         8h/IDjI1QJM6gfsXFwLpIjMNTV3HdOCzf2MF8TC0IGyDufJXNWTgA2SCtM6O5JFHxf/K
         wBYg==
X-Gm-Message-State: ANhLgQ0TZHqPhQWkq7Sa/vL8Hlc0SMT4KmLwQKN8b20MGuGsaDbr0gHL
        Laogfw8vTbChWixLUPUrd/8=
X-Google-Smtp-Source: ADFU+vuDEXtu0owO8awz/KACW4rz8tufMrdDQy2MwmRYzbjVOVtiwz7P6DszG8SH8pOP7sntijutrA==
X-Received: by 2002:a19:6416:: with SMTP id y22mr16074315lfb.60.1585046503326;
        Tue, 24 Mar 2020 03:41:43 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id l11sm9796879lfg.87.2020.03.24.03.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 03:41:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1jGgzz-0006bP-OA; Tue, 24 Mar 2020 11:41:31 +0100
Date:   Tue, 24 Mar 2020 11:41:31 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Michael Hanselmann <public@hansmi.ch>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
Subject: Re: [PATCH 3/4] ch341: Limit prescaler on HL340 variant
Message-ID: <20200324104131.GG5810@localhost>
References: <cover.1583520568.git.public@hansmi.ch>
 <d76985a6dcf1b4aeec783dd8c8b59f054b51e07d.1583520568.git.public@hansmi.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d76985a6dcf1b4aeec783dd8c8b59f054b51e07d.1583520568.git.public@hansmi.ch>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 06, 2020 at 07:00:44PM +0000, Michael Hanselmann wrote:
> HL340 devices, a subset of all CH340 devices, do not work correctly when
> the highest prescaler bit (0b100) is set. Limit these to the lower
> prescaler values at the cost of timing precision.

When we discussed this off list, you said that your device could handle
the highest prescaler bit being set for some rates. You specifically
confirmed that the 576000 and 921600 rates worked, while 110, 134 and
200 did not.

Could you reconfirm which, if any, of the following rates work with the
current driver?

	    1152000
             921600
             576000
                200
                134
                110

Perhaps we can still continue supporting the higher rates, which are way
off unless using the factor-2 prescaler.

Johan
