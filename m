Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6375C19A28C
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 01:35:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731541AbgCaXfe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 31 Mar 2020 19:35:34 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38931 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731438AbgCaXfe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 31 Mar 2020 19:35:34 -0400
X-Originating-IP: 81.6.44.130
Received: from [172.22.0.76] (unknown [81.6.44.130])
        (Authenticated sender: hansmi@hansmi.ch)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2903460005;
        Tue, 31 Mar 2020 23:35:31 +0000 (UTC)
From:   Michael Hanselmann <public@hansmi.ch>
Subject: Re: [PATCH 3/4] ch341: Limit prescaler on HL340 variant
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Michael Dreher <michael@5dot1.de>,
        Jonathan Olds <jontio@i4free.co.nz>
References: <cover.1583520568.git.public@hansmi.ch>
 <d76985a6dcf1b4aeec783dd8c8b59f054b51e07d.1583520568.git.public@hansmi.ch>
 <20200324104131.GG5810@localhost>
X-Hello-World:  This header intentionally left blank
Message-ID: <04a5f5c8-c1e4-b84d-78f8-344b16f6cf01@msgid.hansmi.ch>
Date:   Wed, 1 Apr 2020 01:35:31 +0200
MIME-Version: 1.0
In-Reply-To: <20200324104131.GG5810@localhost>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 24.03.20 11:41, Johan Hovold wrote:
> On Fri, Mar 06, 2020 at 07:00:44PM +0000, Michael Hanselmann wrote:
>> HL340 devices, a subset of all CH340 devices, do not work correctly when
>> the highest prescaler bit (0b100) is set. Limit these to the lower
>> prescaler values at the cost of timing precision.
> 
> When we discussed this off list, you said that your device could handle
> the highest prescaler bit being set for some rates. You specifically
> confirmed that the 576000 and 921600 rates worked, while 110, 134 and
> 200 did not.
> 
> Could you reconfirm which, if any, of the following rates work with the
> current driver?
> 
> 	    1152000
>              921600
>              576000
>                 200
>                 134
>                 110
> 
> Perhaps we can still continue supporting the higher rates, which are way
> off unless using the factor-2 prescaler.

You're right, 110, 134 and 200 don't work whereas 576000, 921600 and
1152000 do. I totally missed this while working on the patch.

I ended up doing more research and figured out that fact=0 with ps=0..3
works, as does fact=1 with ps=3. It's only fact=1 with ps0..2 which is
not working properly.

The next revision of the series will contain additional patches to
restructure the prescaler computation before implementing the quirk.

Michael
