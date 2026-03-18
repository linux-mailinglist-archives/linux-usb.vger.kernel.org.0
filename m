Return-Path: <linux-usb+bounces-35029-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBvgAA9mumklWAIAu9opvQ
	(envelope-from <linux-usb+bounces-35029-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:45:03 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 939192B851E
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 09:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 847F830515CB
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85D4935CB70;
	Wed, 18 Mar 2026 08:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DimhpEze"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E41036AB69;
	Wed, 18 Mar 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773823149; cv=none; b=BUMWEkvKfo/yQ6uaFSvJvTfVHYP4avikrfiMZP+H4DPL3A7+PwagLn65L+uLVTQ30ZmpUbi6JDYtUr3sq+B6fUcleUrNXE0VEgRJbaGE5sWmAVnu+MFyy2YyERdMg6xILyKT31O4Ifiq+zSwRIy0J4PXFAEIiYSVPzprwdpw/iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773823149; c=relaxed/simple;
	bh=uGu9YbU+16zs5mB3ZXB2rvRR4G1yd2IDXMtm7HSCqAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBYllnrSnU9t3WFNciKzHubj8M4kURNiU9CD38NRQpNOkj7k+vvrtbtt7VbVaNd3PcvJqRjsQWtPjXgd5WmvJu8nYWlZZ0vroGIntQi5PspvtLX3dvfynybJu2U6/Cwb+ijh7aVs1iCbxnJpXkokJJZlIgx5aq37vosK5uzpYCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DimhpEze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DA5C19421;
	Wed, 18 Mar 2026 08:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773823148;
	bh=uGu9YbU+16zs5mB3ZXB2rvRR4G1yd2IDXMtm7HSCqAI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DimhpEzevqwFWdfUytn9NDtjhQ2JNMsksYl0rWGbbBPeln20eQtJdhUtiHi0Is1Bk
	 7vS6tXWflFhuFKF4UVwFk5OHdmVI6qwc0sqXx0M3Hspjla6+X9bdNF2+hLDdUuqT95
	 aAhOnuqo7RRjX8+ordbQ22rZ25VKE+8j89RfrUYSq5QpD4Ecvqf+xEvadz+Wb/w+2Q
	 YZXqVJKFTYVBxKniTOdpYrsqBSPOyYe/DxK87dsjdeyI29zbAxucnAjC6WC0QYfQCs
	 qakx9J8bHoadQW0IrVdk8OCS9ppbzqwwVnUhNJZlUtyHfzAft1du3lGf6Lg4ldmTpf
	 CvZUSx/erqY1Q==
Message-ID: <c816a7b4-5237-4732-85af-26b70dce57f5@kernel.org>
Date: Wed, 18 Mar 2026 09:39:03 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: rockchip: Add HUSB311 Type-C
 controller on RK3576 EVB1
To: Alexey Charkov <alchark@flipper.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gene Chen <gene_chen@richtek.com>, Heiko Stuebner <heiko@sntech.de>,
 Yuanshen Cao <alex.caoys@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260317-husb311-v2-0-03c17c986abe@flipper.net>
 <20260317-husb311-v2-5-03c17c986abe@flipper.net>
 <20260318-able-goose-of-downpour-db3bbd@quoll>
 <d925c15d-add5-4f2a-8eac-fa7dd1b56bf2@kernel.org>
 <CAKTNdwH7RswOSBZyVKvsHfhZ3-xwyDs7ywOHuafMFb1-xNf0PA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAKTNdwH7RswOSBZyVKvsHfhZ3-xwyDs7ywOHuafMFb1-xNf0PA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35029-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.intel.com,linuxfoundation.org,richtek.com,sntech.de,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[flipper.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 939192B851E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/03/2026 09:30, Alexey Charkov wrote:
> On Wed, Mar 18, 2026 at 12:19 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 18/03/2026 09:17, Krzysztof Kozlowski wrote:
>>> On Tue, Mar 17, 2026 at 10:08:02PM +0400, Alexey Charkov wrote:
>>>> Rockchip RK3576 EVB1 board has a Hynetek HUSB311 USB Type-C controller on
>>>> its Type-C OTG port, which also supports DisplayPort Alternate Mode.
>>>>
>>>> Add the required DT nodes to enable basic HUSB311 operation.
>>>>
>>>> Note that for full support of mode and orientation switching, the USBDP
>>>> PHY schema may need to be expanded, such as in [1]. This is left out for
>>>> now until the respective schema is finalized and merged.
>>>>
>>>> [1] https://lore.kernel.org/linux-rockchip/20260313-rockchip-usbdp-cleanup-v3-1-3e8fe89a35b5@collabora.com/
>>>>
>>>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
>>>> ---
>>>>  arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>
>>> DTS patch must not be in this patchset. Don't mix it.
>>
>> In case I am too vague: by don't mix it, I mean - separate DTS changes
>> to independent patchset. They cannot be combined into USB posting.
> 
> Thanks Krzysztof. I will split them out in the next submission. I
> think it's important to first agree on the use of fallback compatibles
> and the best way to handle the (already queued up in next) ET7304
> patches this cycle before their bindings hit mainline. Then, I can
> rebase and squash/split everything as required.

These are independent problems. But if you want to connect them, then
here you have:
If I review the patch, Greg will take everything, defeating the purpose
of my comment. So as you can see, I should rather not review them to
achieve one of my goals.

Best regards,
Krzysztof

