Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 803893E9E03
	for <lists+linux-usb@lfdr.de>; Thu, 12 Aug 2021 07:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbhHLFjz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Aug 2021 01:39:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:33770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234361AbhHLFjy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 12 Aug 2021 01:39:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 578D660F00;
        Thu, 12 Aug 2021 05:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628746770;
        bh=0lgj21KpTqtr+NDqWng3jxh1RHjNJFgLoBbh5rHsSaY=;
        h=References:From:To:Cc:Subject:Date:In-reply-to:From;
        b=Qc8/0gaB6GWKoVP5hpzCj/PlkWWObCObLiKCWpdNivwkGSjZXgRkxsBJXUvdv4t7t
         IQq0wJ7/rxskxtTOkjxyoxnfH2dqaMFHvLTJaqJoUSREkLHHHf0VekH1XaQ52mQV3h
         ExA61yJAGJAZ264N5bjxN57aQhSthzKA5/i4ZeZIxqE1584qvn/if7X+E2/7A4OWNu
         pXfT4O/jtPFe4a2XbMj2rUOEKqasX66YWXT/VeEqaPmNU2a2e54+X9bAOAVH4Xs+pd
         icZPA3XSNbXR13WQaZFIXVZr+F+8xvGoL6QSwaFIgCln2e59Qg3CKvr3uXpUaHyiME
         N8GzX6hJ3+WQw==
References: <47bacc02-4e34-3208-779c-7072a6261782@omp.ru>
 <71d33de9-ffee-705d-843a-dfc1b1c0bbc6@omp.ru>
User-agent: mu4e 1.6.2; emacs 27.2
From:   Felipe Balbi <balbi@kernel.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 8/9] usb: phy: tahvo: add IRQ check
Date:   Thu, 12 Aug 2021 08:39:17 +0300
In-reply-to: <71d33de9-ffee-705d-843a-dfc1b1c0bbc6@omp.ru>
Message-ID: <87y297z0fk.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Sergey Shtylyov <s.shtylyov@omp.ru> writes:

> The driver neglects to check the result of platform_get_irq()'s call and
> blithely passes the negative error codes to request_irq() (which takes
> *unsigned* IRQ #), causing it to fail with -EINVAL, overriding an original
> error code. Stop calling request_irq() with the invalid IRQ #s.
>
> Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Acked-by: Felipe Balbi <balbi@kernel.org>


-- 
balbi
