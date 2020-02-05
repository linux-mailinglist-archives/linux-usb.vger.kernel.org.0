Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22F771530D9
	for <lists+linux-usb@lfdr.de>; Wed,  5 Feb 2020 13:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727043AbgBEMfh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Feb 2020 07:35:37 -0500
Received: from mail-lf1-f47.google.com ([209.85.167.47]:39764 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbgBEMfh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Feb 2020 07:35:37 -0500
Received: by mail-lf1-f47.google.com with SMTP id t23so1362483lfk.6
        for <linux-usb@vger.kernel.org>; Wed, 05 Feb 2020 04:35:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Kqzr4R0AEmCjIdgI0cXRKfb8Gx6oEjJ5uXG99VHbSwo=;
        b=o0nVD5ggr9g3gELGymBc2bj2dYfHgJx+UIKOnpSDg/LyqQYaORxrL9u9lsPZjLhDsa
         OhE88i3ywT3Ub+/JyLsxjlihVgo0n0cPURfiCLEQWvb9jw8rzI6YRswsmdhJvneFgjqA
         9aQVLQrJ4eNUoq44ucs3rpKCsZ+VlgV4+6OWfYw/hewSW4+1qxAWcOPL7oLkN8nAErwK
         r/lShU4jK3Dfus4zhlMVdjgtUQfgzndXYmz1bxSfj5b0DiLcpmkmrbmU2JHM56McQ01e
         FrQXsXFoYqACtEPD+Wm+Hj9JdYLdElwHHcMLLXElf8GnXUJbOORCl2/CRptbQUYmJhFv
         6ZJw==
X-Gm-Message-State: APjAAAVzQyRpdDeednLSPyToDygPtBRfdfvwWKZ3+fhDebAgn8w/Gs9h
        aJgt10eUtILHV9Esx661NrDGILC3
X-Google-Smtp-Source: APXvYqzKezUry54zISTqZf60Gf3B9i4oc6Y7ar0H0hrrBOh0kqzwAKiYO9hsnucR7HeSvsih7YIPRw==
X-Received: by 2002:ac2:5216:: with SMTP id a22mr17407424lfl.18.1580906135407;
        Wed, 05 Feb 2020 04:35:35 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id v7sm12222771lfa.10.2020.02.05.04.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 04:35:34 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1izJuC-0004q7-KQ; Wed, 05 Feb 2020 13:35:44 +0100
Date:   Wed, 5 Feb 2020 13:35:44 +0100
From:   Johan Hovold <johan@kernel.org>
To:     jakub nantl <jn@forever.cz>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: ch341 garbage read with 5.5.x kernel
Message-ID: <20200205123544.GS26725@localhost>
References: <b23691c8-9219-b360-6114-93e86a8bd997@forever.cz>
 <20200205074312.GP26725@localhost>
 <fb82eb2f-ff8d-1e02-2f48-9667c86742a4@forever.cz>
 <20200205085043.GR26725@localhost>
 <f93e2b85-44c4-315a-9adb-6677fc362757@forever.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f93e2b85-44c4-315a-9adb-6677fc362757@forever.cz>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 05, 2020 at 01:31:04PM +0100, jakub nantl wrote:
> On 05. 02. 20 9:50, Johan Hovold wrote:
> > Can you try the below patch which restores a component included in the
> > first version of the new algorithm, but which I ultimately deemed
> > redundant?
> 
> Hello Johan,
> 
> your patch has helped, thanks...

Great, thanks for confirming. I'll see to that this gets fixed in stable
ASAP.

Where you able to determine which rate your Arduino actually uses for
115200 by the way?

Johan
