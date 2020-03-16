Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75688186A1A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 12:32:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730828AbgCPLcZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 07:32:25 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:47640 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730759AbgCPLcZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 07:32:25 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id CE076291A6E
Subject: Re: [PATCH 0/2] Staging: media: rkisp1: trim diagram in comments to
 80 chars
To:     Enrique Vargas <jevargas@seas.upenn.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        outreachy-kernel@googlegroups.com
Cc:     linux-usb@vger.kernel.org
References: <cover.1584298430.git.jevargas@seas.upenn.edu>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c4e2ce5d-848c-3a97-9260-57c67d94cd6e@collabora.com>
Date:   Mon, 16 Mar 2020 08:32:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <cover.1584298430.git.jevargas@seas.upenn.edu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Enrique,

On 3/15/20 3:59 PM, Enrique Vargas wrote:
> *** BLURB HERE ***

I think you forgot to fill out the cover letter.

Please, see more information on https://kernelnewbies.org/PatchSeries

Let me know if you have any questions.

Regards,
Helen

> 
> Enrique Vargas (2):
>   reduce comments width bellow 80 chars
>   eliminate trailing whitespaces on comments
> 
>  drivers/staging/media/rkisp1/rkisp1-dev.c | 54 ++++++++++++++++-------
>  1 file changed, 37 insertions(+), 17 deletions(-)
> 
